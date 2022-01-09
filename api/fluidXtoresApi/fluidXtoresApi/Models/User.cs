namespace fluidXtoresApi.Models
{
    public class User
    {

        public long UserId { get; set; }
        public string firstName { get; set; }
        public string lastName { get; set; }
        public string UserEmail { get; set; }
        public string UserPassword { get; set; }
        public string? profilePictureUrl { get; set; }
        public bool? rememberLogin { get; set; }
        public bool? isAuthenticated { get; set; }
        public string? phone { get; set; }
        public string? birthDate { get; set; }
        

    }
}
