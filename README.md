# OscarBetting_usingTellor


THIS IS A SUBMISSION FOR GITCON GRANTS 8 HACKATHON



The contract Fetches values from the TellorPlayground Contract and Provides a MoneyLine Betting Platform for the Betters.
User can bet for desired amount using the bet() function in the contract.After the winners are declared,If individial has betted on right person he is eligible to claim the rewards.

# The MoneyLine betting system in Place
 The system is divided into Categories of Awards and Nominees for that Category.Currently assumed 4 Nominees for each category. 
 Each Nominee has a value(positive or negative),this is a percentage value as in the % for money you will lose/win if you bet on this Nominee.
 
 # Functions In The Contract
 
 1. fetchCurrentValues(tellorid):
    This contract fetches the current values of the nominees from the tellor playground and save it locally for further use.Need to pass the tellor_id for the required data point
    
 2. bet(category_id,nominee_id,amount):
    This function places the users bet on the respective nominee. It is a payable function and need to pass the minimum betting value to invoke it.
    
 3. fetchwinners():
    This function can only be called by the owner of the smart contract.The winner values will be fetched from the Tellor Oracle
    
 4. claimRewards(nominee_id,amount):
    It is called by the better who had placed the winning bet.It is a payable function, the function caller will be awarded based on the betting amount and nominee value.
    
  
  
  # Tellor DataPoint:
     1 datapoint for each category must be added.
     
     structure of data point:
     16 digits-4 digits for each nominee-for nominee,1st digit is signbit and next 3 the %value
     
     eg:
     
     DP: 1020005010120010
     Nominee1 Value= -20%
     Nominee2 Value=  50%
     Nominee3 Value= -10%
     Nominee4 Value=  10%
     
     
    
    
    
    PS: Currently Implemented for 1 category Only
     
     
     
     
    
    
    
 



