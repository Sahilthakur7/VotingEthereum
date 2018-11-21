pragma solidity ^0.4.2;

contract Election {

    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }

    mapping(address => bool) public voters;
    mapping(uint => Candidate) public candidates;

    uint public candidatesCount;

    function Election () public {
        addCandidate("Amit Patial");
        addCandidate("Karanvir Singh");
    }

    function addCandidate(string _name) private {
        candidatesCount++;
        candidates[candidatesCount] = Candidate(candidatesCount,_name,0);
    }

    function vote(uint _candidateId) public {
        require(!voters[msg.sender]);
        voters[msg.sender] = true;
        candidates[_candidateId].voteCount ++ ;
    }
}
