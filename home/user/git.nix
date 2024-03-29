let
  userName = "gpskwlkr";
  email = "giorgi.anakidze@outlook.com";
in
{
    programs.git = {
        enable = true;
        userName = userName;
        userEmail = email;
    };
}
