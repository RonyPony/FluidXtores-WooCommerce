using Microsoft.EntityFrameworkCore;

namespace fluidXtoresApi.Models
{
    public class userContext:DbContext
    {
        public userContext(DbContextOptions<userContext>options):base(options)
        {

        }

        public DbSet<User> Users { get; set; } = null!;
    }
}
