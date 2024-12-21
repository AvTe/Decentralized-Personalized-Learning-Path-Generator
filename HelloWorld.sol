// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract UserLoginInfo {
    struct UserInfo {
        string email;
        string username;
        string password;
    }

    UserInfo private user;

    // Function to set user information
    function setUserInfo(string memory _email, string memory _username, string memory _password) public {
        user = UserInfo({
            email: _email,
            username: _username,
            password: _password
        });
    }

    // Function to get user information
    function getUserInfo() public view returns (string memory, string memory, string memory) {
        return (user.email, user.username, user.password);
    }
}
