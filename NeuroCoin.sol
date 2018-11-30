pragma solidity ^0.4.24;

import "./ERC721Full.sol";
import "./ERC721.sol";

contract NeuroCoin is ERC721, ERC721Full {
    
    struct NeuralNetwork{
        string name;
        address developer;
        string domainName;
        uint accuracy;
        uint trainingHours;
    }
    
    // Record Of All NeuralNetwork That Exists
    NeuralNetwork[] public NeuralNetworks;
    // Address of the Owner
    address owner;
    
    function NeuroCoin() public {
        owner = msg.sender;
    }
    
    function ProvideNeuralNetworkToVC(string _name,string _domainName, string _accuracy, string _trainingHours, address _address) public {
        require(owner == msg.sender);
        
        NeuralNetworks.push(NeuralNetwork(
            _name,
            msg.sender,
            _domainName,
            _accuracy,
            _trainingHours
            ));
            
            _mint(_address, NeuralNetworks.length);
    }
}
