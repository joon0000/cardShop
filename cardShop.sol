// SPDX-License-Identifier: MIT
pragma solidity ^0.8.1;

contract ProofOfCharacter {  

  mapping (bytes32 => bool) private listChar;

  struct Bought{
        string time;
        string name;
        string owner;
    }
    Bought[] bought;

  //---events---
  event NameAdded(
    address from,   
    string name,
    string time,
    bytes32 hash
  );
  
  event RegistrationError(
    address from,
    string text,
    string reason
  );

  // store the proof for a student in the contract state
  function recordProof(bytes32 proof) private {
    listChar[proof] = true;
  }
  
  // record a student name
  function btn1(string memory name,string memory owner,string memory time) public payable {
    
    //---check if string was previously stored---
    if (listChar[hashing(name)]) {
        //---fire the event---
        emit RegistrationError(msg.sender, name, 
            "This character was bought previously.");

        //---refund back to the sender---
        payable(msg.sender).transfer(msg.value);
        
        //---exit the function---
        return;
    }
    
    //---check if msg.value != 0.002 ether---
    if (msg.value != 0.0000007 ether) {
        //---fire the event---
        emit RegistrationError(msg.sender, name, 
            "Incorrect amount of Ether. 0.0000007 ether for buying");
        
        //---refund back to the sender---
        payable(msg.sender).transfer(msg.value);
        
        //---exit the function---
        return;
    }
 
    recordProof(hashing(name));
    bought.push(Bought(time,name,owner));  
    //---fire the event---
    emit NameAdded(msg.sender, name, time,
        hashing(name));
  }

  // record a student name
  function btn2(string memory name,string memory owner,string memory time) public payable {
    
    //---check if string was previously stored---
    if (listChar[hashing(name)]) {
        //---fire the event---
        emit RegistrationError(msg.sender, name, 
            "This character was bought previously.");

        //---refund back to the sender---
        payable(msg.sender).transfer(msg.value);
        
        //---exit the function---
        return;
    }
    
    //---check if msg.value != 0.002 ether---
    if (msg.value != 0.0000006 ether) {
        //---fire the event---
        emit RegistrationError(msg.sender, name, 
            "Incorrect amount of Ether. 0.0000006 ether for buying");
        
        //---refund back to the sender---
        payable(msg.sender).transfer(msg.value);
        
        //---exit the function---
        return;
    }
 
    recordProof(hashing(name));
    bought.push(Bought(time,name,owner));
    //---fire the event---
    emit NameAdded(msg.sender, name, time,
        hashing(name));
  }

  // record a student name
  function btn3(string memory name,string memory owner,string memory time) public payable {
    
    //---check if string was previously stored---
    if (listChar[hashing(name)]) {
        //---fire the event---
        emit RegistrationError(msg.sender, name, 
            "This character was bought previously.");

        //---refund back to the sender---
        payable(msg.sender).transfer(msg.value);
        
        //---exit the function---
        return;
    }
    
    //---check if msg.value != 0.002 ether---
    if (msg.value != 0.0000005 ether) {
        //---fire the event---
        emit RegistrationError(msg.sender, name, 
            "Incorrect amount of Ether. 0.0000005 ether for buying");
        
        //---refund back to the sender---
        payable(msg.sender).transfer(msg.value);
        
        //---exit the function---
        return;
    }
 
    recordProof(hashing(name));
    
    bought.push(Bought(time,name,owner));

    //---fire the event---
    emit NameAdded(msg.sender, name, time,
        hashing(name));
  }
  // record a student name
  function btn4(string memory name,string memory owner,string memory time) public payable {
    
    //---check if string was previously stored---
    if (listChar[hashing(name)]) {
        //---fire the event---
        emit RegistrationError(msg.sender, name, 
            "This character was bought previously.");

        //---refund back to the sender---
        payable(msg.sender).transfer(msg.value);
        
        //---exit the function---
        return;
    }
    
    //---check if msg.value != 0.002 ether---
    if (msg.value != 0.0000004 ether) {
        //---fire the event---
        emit RegistrationError(msg.sender, name, 
            "Incorrect amount of Ether. 0.0000004 ether for buying");
        
        //---refund back to the sender---
        payable(msg.sender).transfer(msg.value);
        
        //---exit the function---
        return;
    }
 
    recordProof(hashing(name));

    bought.push(Bought(time,name,owner));
    
    //---fire the event---
    emit NameAdded(msg.sender, name, time,
        hashing(name));
  }
  // record a student name
  function btn5(string memory name,string memory owner,string memory time) public payable {
    
    //---check if string was previously stored---
    if (listChar[hashing(name)]) {
        //---fire the event---
        emit RegistrationError(msg.sender, name, 
            "This character was bought previously.");

        //---refund back to the sender---
        payable(msg.sender).transfer(msg.value);
        
        //---exit the function---
        return;
    }
    
    //---check if msg.value != 0.002 ether---
    if (msg.value != 0.0000003 ether) {
        //---fire the event---
        emit RegistrationError(msg.sender, name, 
            "Incorrect amount of Ether. 0.0000003 ether for buying");
        
        //---refund back to the sender---
        payable(msg.sender).transfer(msg.value);
        
        //---exit the function---
        return;
    }
 
    recordProof(hashing(name));
    
    bought.push(Bought(time,name,owner));
    //---fire the event---
    emit NameAdded(msg.sender, name, time,
        hashing(name));
  }

 function test(string memory name,string memory owner,string memory time) public {
    recordProof(hashing(name));
    bought.push(Bought(time,name,owner));
  }
  
  // SHA256 for Integrity
  function hashing(string memory name) private 
  pure returns (bytes32) {
    return sha256(bytes(name));
  }
  
  // check name of student in this class
  function checkName(string memory name) public 
  view returns (bool) {
    return listChar[hashing(name)];
  }

  function getOwnerList() public view returns(Bought[] memory){
    return bought;
  }
}
