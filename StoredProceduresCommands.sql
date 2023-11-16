--EXEC CW1.InsertUser @Username = 'Alan Turing', @Email = 'alan@plymouth.ac.uk', @Password = 'Enigma123!';

EXEC CW1.UpdateUser @Email = 'tim@plymouth.ac.uk' , @Password = 'COMP2000!', @newUsername = 'Esther Skillman', @newEmail = 'esther@plymouth.ac.uk', @newPassword = 'Boop2000!';

--EXEC CW1.DeleteUser @UserNo = 3;
