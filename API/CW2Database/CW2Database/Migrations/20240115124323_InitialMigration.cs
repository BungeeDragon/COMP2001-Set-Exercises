using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace CW2Database.Migrations
{
    public partial class InitialMigration : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "FavouriteActivities",
                columns: table => new
                {
                    UserNo = table.Column<int>(type: "int", nullable: false),
                    Activities = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    FavouriteActivities = table.Column<bool>(type: "bit", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_FavouriteActivities", x => new { x.UserNo, x.Activities });
                });

            migrationBuilder.CreateTable(
                name: "UserData",
                columns: table => new
                {
                    Email = table.Column<string>(type: "nvarchar(320)", maxLength: 320, nullable: false),
                    AboutMe = table.Column<string>(type: "nvarchar(720)", maxLength: 720, nullable: true),
                    MemberLocation = table.Column<string>(type: "VARCHAR(MAX)", maxLength: 2147483647, nullable: true),
                    Units = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: true),
                    ActivityTimePreference = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: true),
                    userHeight = table.Column<decimal>(type: "DECIMAL(5,1)", nullable: true),
                    userWeight = table.Column<int>(type: "int", nullable: true),
                    Birthday = table.Column<DateTime>(type: "datetime2", nullable: true),
                    MarketingLanguage = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_UserData", x => x.Email);
                });

            migrationBuilder.CreateTable(
                name: "Users",
                columns: table => new
                {
                    UserNo = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    userStatus = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Username = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Email = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    userPassword = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Users", x => x.UserNo);
                });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "FavouriteActivities");

            migrationBuilder.DropTable(
                name: "UserData");

            migrationBuilder.DropTable(
                name: "Users");
        }
    }
}
