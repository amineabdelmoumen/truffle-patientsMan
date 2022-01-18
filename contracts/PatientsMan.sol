pragma solidity >=0.4.22 <0.9.0;


contract PatientsMan {
    uint public  patientsCount=0;

    struct Patient {
        uint id;
        string patientName;
        string patientEmail;
        string patientDiagnostic;
        bool completed;

    }

    //we use event to broadcast an event that happend in our smart contract
    event PatientsAdded( 
        uint id,
        string patientName,
        string patientEmail,
        string patientDiagnostic,
        bool completed

    );
    event PatientCompleted(
    uint id,
    bool completed
  );
  event PatientDeleted(
      uint id
  );

    constructor() public {
        addPatient('amineabdelmoumen','amine@gmail.com','covid-19');
        addPatient('anas','anas@gmail.com','omicron');
        addPatient('ahmed','ahmed@gmail.com','Grippe');
        addPatient('mohammed','mohammed@gmail.com','i dont konw');

        
    }
    mapping(uint => Patient) public  Patients;
     

     function addPatient(string memory _patientName,string memory _patientEmail,string memory _patientDiagnostic) public{
        patientsCount++;
      
        Patients[patientsCount]=Patient(patientsCount,_patientName,_patientEmail, _patientDiagnostic,false);
        emit PatientsAdded(patientsCount,_patientName,_patientEmail, _patientDiagnostic,false);

     }
    

  function toggleCompleted(uint _id) public {
    Patient memory _patient = Patients[_id];
    _patient.completed = !_patient.completed;
    Patients[_id] = _patient;
    emit PatientCompleted(_id, _patient.completed);
  }

  function deletePatient(uint _id) public {
      Patient memory _patient=Patients[_id];
      if (_patient.completed==true){
          delete Patients[_id];
          emit PatientDeleted(_id);
      }     
  }

}