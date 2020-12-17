pragma solidity >=0.4.21 <0.7.0;

import "usingtellor/contracts/UsingTellor.sol";

contract OscarBetting is UsingTellor {
    
    address owner;
    uint64 minbet=1;
    uint64 winner;
    constructor(address payable _tellorAddress) UsingTellor( _tellorAddress) public {
        
        owner=msg.sender;
    }
    
   struct betOn
   {
       
       uint nommineeNo;
       uint64 amount;
   }
   
  
   mapping(uint64 => mapping(address => betOn)) public bets; // category->better_address->beton 
   mapping(uint64 =>mapping(uint64 => int)) public bettingValues; //catid -> nomineeId -> value
   
   modifier onlyOwner{
       require(msg.sender==owner);
       _;
   }
   
   function fetchCurrentValues(uint256 tellorid) external onlyOwner  
   {
       (bool success,uint256 values,uint256 timestamp)=getCurrentValue(tellorid);
       if(success)
       {
           
          
        
         if(values%10000>1000)
         {
             bettingValues[1][3]=int(-(values%1000));
         }
         else
         {
              bettingValues[1][3]=int(values%10000);
         }
    
         values=values/10000;
        if(values%10000>1000)
         {
              bettingValues[1][2]=int(-(values%1000));
         }
         else
         {
              bettingValues[1][2]=int(values%10000);
         }
         values=values/10000;
         if(values%10000>1000)
         {
              bettingValues[1][1]=int(-(values%1000));
         }
         else
         {
              bettingValues[1][1]=int(values%10000);
         }
         values=values/10000;
         if(values%10000>1000)
         {
              bettingValues[1][0]=int(-(values%1000));
         }
         else
         {
             bettingValues[1][0]=int(values%10000);
         }
         
         
          
       }
   }
   
 
   
 
  function bet(uint64 catid,uint64 nomid,uint64 amt) external payable
  {
      require(msg.value>=minbet,"must pay enough to bet");
      
      //bets[msg.sender][timestamp]=betOn(catid,nomid,amt);
      bets[catid][msg.sender]=betOn(nomid,amt);
      
      
  }
   
   function fetchwinners() public  onlyOwner returns (uint64)
   {
       winner=1;
       return winner;
   }
   
   function claimreward(uint64 id,uint64 amtbetted) public payable returns (bool)
   {
       require(id==winner,"You betted on the wrong nominee");
       require(bets[1][msg.sender].nommineeNo==winner,"You betted on the wrong nominee");
      
       int lottery=(bets[1][msg.sender].amount*(bettingValues[1][winner]/100));
       uint256 prize=uint256(bets[1][msg.sender].amount+lottery);
       msg.sender.transfer(prize);
       
   }
   
   
   
   
    
    
    
    
    
     
}
    
