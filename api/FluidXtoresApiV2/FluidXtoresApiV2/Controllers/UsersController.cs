using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using fluidXtoresApi.Models;
using System.Net.Http;
using System.Net;   

namespace FluidXtoresApiV2.Controllers
{
    [Route("api/users")]
    [ApiController]
    public class UsersController : ControllerBase
    {
        private readonly userContext _context;
        private string _ValidNewUserInfoErrorMessage = "";

        public UsersController(userContext context)
        {
            _context = context;
        }

        // GET: api/Users
        [HttpGet]
        public async Task<ActionResult<IEnumerable<User>>> GetUsers()
        {
            return await _context.Users.ToListAsync();
        }

        // GET: api/Users/5
        [HttpGet("{id}")]
        public async Task<ActionResult<User>> GetUser(long id)
        {
            var user = await _context.Users.FindAsync(id);

            if (user == null)
            {
                return NotFound();
            }

            return user;
        }

        [HttpPost("auth")]
        public async Task<ActionResult<AuthUser>> authenticate(AuthUser userInfo)
        {
            var users = _context.Users.FirstOrDefault(u => u.UserEmail == userInfo.email && u.UserPassword == userInfo.password);
            if (users != null)
            {
                AuthUser returningInfo = new AuthUser();
                returningInfo.token = "Not Available";
                returningInfo.email = users.UserEmail;
                returningInfo.nickname = users.firstName;
                returningInfo.displayName = users.firstName + " " + users.lastName;
                return returningInfo;
            }
            else
            {
                return StatusCode(401, "Wrong Credentials   ");
                
            }
        }

        // PUT: api/Users/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPut("{id}")]
        public async Task<IActionResult> PutUser(long id, User user)
        {
            if (id != user.UserId)
            {
                return BadRequest();
            }

            _context.Entry(user).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!UserExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/Users
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPost]
        public async Task<ActionResult<User>> PostUser(User user)
        {
            if (ValidNewUserInfo(user))
            {
                _context.Users.Add(user);
                await _context.SaveChangesAsync();

                return CreatedAtAction(nameof(GetUser), new { id = user.UserId }, user);
            }
            else
            {
                return StatusCode(400,"User information invalid: "+_ValidNewUserInfoErrorMessage);
            }
        }

        private bool ValidNewUserInfo(User user)
        {

            if (user.UserEmail!=null)
            {
                if (!emailExists(user.UserEmail))
                {
                    if (user.firstName!=null && user.lastName!=null)
                    {
                        if (user.UserPassword!=null && user.UserPassword.Length>=8)
                        {
                            return true;
                        }
                        else { 
                            _ValidNewUserInfoErrorMessage = "Password should be more than 8 characters,";
                            return false; 
                        }
                    }
                    else
                    {
                        _ValidNewUserInfoErrorMessage = "User first and last name should be sent";
                        return false;
                    }
                }
                else
                {
                    _ValidNewUserInfoErrorMessage = "This email is already registered";
                    return false;
                }
            }
            else
            {
                _ValidNewUserInfoErrorMessage = "Email is required";
                return false;
            }
        }

        private bool emailExists(string userEmail)
        {
            var user = _context.Users.FirstOrDefault(u => u.UserEmail==userEmail);
            return user != null;
        }

        // DELETE: api/Users/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<User>> DeleteUser(long id)
        {
            var user = await _context.Users.FindAsync(id);
            if (user == null)
            {
                return NotFound();
            }

            _context.Users.Remove(user);
            await _context.SaveChangesAsync();

            return user;
        }

        private bool UserExists(long id)
        {
            return _context.Users.Any(e => e.UserId == id);
        }
    }
}
