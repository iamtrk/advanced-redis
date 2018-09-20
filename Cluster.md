Redis cluster :

    1) Can't use MGET with keys that have multiple slots(Exact slot check).
    
    2) Strictly IP addresses are used, hostnames are not compatible.
    
    3) Each key slot is calculated & is redirected to the corresponding server.
    
    4) 2^14 slots are distributed across all the master nodes in the cluster.So, max 
    number of master nodes in a cluster are capped at 2^14.
    
    5) Slot calculating logic: CRC16(key)%2^14. 14 of the 16 bits are used.
    
    6) Redis cluster is a full mesh where each server maintains N-1 incoming & N-1
    outgoing TCP connections(these connections are kept alive all the time).
    
    7) Uses gossip protocol & a configuration update mechanism.
    
    8) a node accept other node as part of the cluster through either CLUSTER MEET ip port
    command or based in Gossip info.
    
    9) Hash Tags - technique to make sure different keys are hashed to same slot.
    String in the braces only is used for slot hashing. Ex: {url:example.com}.footer
    Useful to store different objects of seo data for a specific url.
    
    10) First add a cluster to the node:
    redis-trib.rb add-node <New server> <Any one server in the cluster>. It will just 
    add the node to the cluster, without much work happening.
    
    11) redis-trib.rb add-node/fix/rebalance/reshard/del-node/check <any cluster server> for operations on 
    the cluster. 

