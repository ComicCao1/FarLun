// calculates if a user is allowed to access a certain donation reward

var/list/reward_values = list(
    "custom_ooc_color" = 1,
)

proc/can_get_reward(var/mob/user as mob, var/reward as text)
    var/donator
    
    if(isclient(user))
        var/client/U = user
        donator = U.donator
    else
        donator = user.client.donator
    
    if(!donator)                    return 0  // not a donator
    
    if(reward_values[reward] && donator >=  reward_values[reward])
        return 1  // has the donator rank required or greater, return true
    else
        return 0 // if not, return false