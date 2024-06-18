using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace CW2Database
{
    public class CW2Database : DbContext
    {
        public CW2Database(DbContextOptions<CW2Database> options) : base(options)
        {
        }

        public DbSet<User> Users { get; set; }
        public DbSet<UserData> UserData { get; set; }
        public DbSet<FavouriteActivity> FavouriteActivities { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasDefaultSchema("CW2");

            // Mapping for Users table
            modelBuilder.Entity<User>()
                .ToTable("Users", "CW2")
                .HasKey(u => u.UserNo);

            modelBuilder.Entity<User>()
                .Property(u => u.UserNo)
                .HasColumnName("UserNo");

            modelBuilder.Entity<User>()
                .Property(u => u.UserStatus)
                .HasColumnName("userStatus");

            modelBuilder.Entity<User>()
                .Property(u => u.Username)
                .HasColumnName("Username");

            modelBuilder.Entity<User>()
                .Property(u => u.Email)
                .HasColumnName("Email");

            modelBuilder.Entity<User>()
                .Property(u => u.UserPassword)
                .HasColumnName("userPassword");


            // Mapping for UserData table
            modelBuilder.Entity<UserData>()
                .ToTable("UserData", "CW2")
                .HasKey(ud => ud.Email);

            modelBuilder.Entity<UserData>()
                .Property(ud => ud.Email)
                .HasColumnName("Email");

            modelBuilder.Entity<UserData>()
                .Property(ud => ud.AboutMe)
                .HasColumnName("AboutMe");

            modelBuilder.Entity<UserData>()
                .Property(ud => ud.MemberLocation)
                .HasColumnName("MemberLocation");

            modelBuilder.Entity<UserData>()
                .Property(ud => ud.Units)
                .HasColumnName("Units");

            modelBuilder.Entity<UserData>()
                .Property(ud => ud.ActivityTimePreference)
                .HasColumnName("ActivityTimePreference");

            modelBuilder.Entity<UserData>()
                .Property(ud => ud.userHeight)
                .HasColumnName("userHeight");

            modelBuilder.Entity<UserData>()
                .Property(ud => ud.userWeight)
                .HasColumnName("userWeight");

            modelBuilder.Entity<UserData>()
                .Property(ud => ud.Birthday)
                .HasColumnName("Birthday");

            modelBuilder.Entity<UserData>()
                .Property(ud => ud.MarketingLanguage)
                .HasColumnName("MarketingLanguage");

            // Mapping for FavouriteActivities table
            modelBuilder.Entity<FavouriteActivity>()
                .ToTable("FavouriteActivity", "CW2")
                .HasKey(fa => new { fa.UserNo, fa.Activities });

            modelBuilder.Entity<FavouriteActivity>()
                .Property(fa => fa.UserNo)
                .HasColumnName("UserNo");

            modelBuilder.Entity<FavouriteActivity>()
                .Property(fa => fa.Activities)
                .HasColumnName("Activities");

            modelBuilder.Entity<FavouriteActivity>()
                .Property(fa => fa.FavouriteActivities)
                .HasColumnName("FavouriteActivities");

            base.OnModelCreating(modelBuilder);
        }
    }

    public class User
    {
        [Key]
        [Column("UserNo")]
        public int UserNo { get; set; }

        [Column("userStatus")]
        public string UserStatus { get; set; }

        [Column("Username")]
        public string Username { get; set; }

        [Column("Email")]
        public string Email { get; set; }

        [Column("userPassword")]
        public string UserPassword { get; set; }
    }

    public class UserVerificationRequest
    {
        public string userName { get; set; }

        public string email { get; set; }

        public string password { get; set; }
    }

    public class UserData
    {
        [Key]
        [MaxLength(320)]
        [Required]
        public string Email { get; set; }

        [MaxLength(720)]
        public string AboutMe { get; set; }

        [MaxLength(int.MaxValue)]
        [Column(TypeName = "VARCHAR(MAX)")]
        public string MemberLocation { get; set; } = "Plymouth, Devon, England";

        [MaxLength(255)]
        public string Units { get; set; } = "Metric";

        [MaxLength(255)]
        public string ActivityTimePreference { get; set; } = "Pace";

        [Column(TypeName = "DECIMAL(5, 1)")]
        public decimal? userHeight { get; set; }

        public int? userWeight { get; set; }

        public DateTime? Birthday { get; set; }

        [MaxLength(255)]
        public string MarketingLanguage { get; set; } = "English(UK)";

    }
    public class FavouriteActivity
    {
        [Key]
        [Column("UserNo")]
        public int UserNo { get; set; }

        [Key]
        [Column("Activities")]
        public string Activities { get; set; }

        [Column("FavouriteActivities")]
        public bool FavouriteActivities { get; set; }
    }

    // This is a class used within the UpdateProfile method 
    public class updateUserData
    {
        public string NewEmail { get; set; }
        public string NewUsername { get; set; }
        public string NewPassword { get; set; }

        [MaxLength(720)]
        public string AboutMe { get; set; }

        [MaxLength(int.MaxValue)]
        [Column(TypeName = "VARCHAR(MAX)")]
        public string MemberLocation { get; set; } = "Plymouth, Devon, England";

        [MaxLength(255)]
        public string Units { get; set; } = "Metric";

        [MaxLength(255)]
        public string ActivityTimePreference { get; set; } = "Pace";

        [Column(TypeName = "DECIMAL(5, 1)")]
        public decimal? userHeight { get; set; }

        public int? userWeight { get; set; }

        public DateTime? Birthday { get; set; }

        [MaxLength(255)]
        public string MarketingLanguage { get; set; } = "English(UK)";
    }
}