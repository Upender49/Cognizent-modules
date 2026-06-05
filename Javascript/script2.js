const events = [];
function addtolist() {
    const name = document.getElementById("name").value;
    const email = document.getElementById("email").value;
    const date = document.getElementById("date").value;
    const message = document.getElementById("message").value;
    const eventType = document.getElementById("eventtype").value;
    events.push({ "name" : name, "email" : email, "date" : date, "message" : message, "eventType" :  eventType });
    console.log("Current events list:", events);
    console.log("Script2 loaded. Initial events list:", events);
}
const portalName = "Local Community Event Portal";
const portalVersion = "v1.0";

let totalRegistrations = 0;
let activeUsers = 0;

function buildWelcomeMessage(user) {
    return `Hello ${user}, welcome to ${portalName} ${portalVersion}!`;
}

function increaseRegistration() {
    totalRegistrations++;   
    console.log(`Total registrations increased to: ${totalRegistrations}`);
}

function decreaseRegistration() {
    if (totalRegistrations > 0) {
        totalRegistrations--; 
        console.log(`Total registrations decreased to: ${totalRegistrations}`);
    }
}
buildWelcomeMessage("Alice");
// increaseRegistration();
// increaseRegistration();
// decreaseRegistration();
const eventsData = [
    { name: "Workshop", date: "2026-07-15", seats: 50, category: "workshop", fee: "Free" },
    { name: "Seminar", date: "2026-08-20", seats: 30, category: "seminar", fee: "$10" },
    { name: "Conference", date: "2026-09-10", seats: 100, category: "conference", fee: "$25" }
];

function isEventValid(event) {
   // const today = new Date().toISOString().split('T')[0];
    const today = new Date().toISOString();
    console.log(today);
    if (event.date < today) {
        return false; // Past event
    } else if (event.seats <= 0) {
        return false; // Full event
    } else {
        return true;  // Valid
    }
}

function logEventStatus() {
    console.log("=== Event Status Check ===");

    eventsData.forEach((event, index) => {
        if (isEventValid(event)) {
            console.log(`✅ ${index + 1}. ${event.name} is open (${event.seats} seats)`);
        } else {
            console.log(`❌ ${index + 1}. ${event.name} is unavailable`);
        }
    });
}

function safeRegisterUser(userName, eventIndex) {
    try {
        if (!userName || userName.trim() === "") {
            throw new Error("User name is required!");
        }
        if (!eventsData[eventIndex]) {
            throw new Error("Invalid event selected!");
        }
        if (eventsData[eventIndex].seats <= 0) {
            throw new Error(`${eventsData[eventIndex].name} is fully booked!`);
        }
        
        // Success: reduce seat count
        eventsData[eventIndex].seats--;
        increaseRegistration();
        console.log(`✅ ${userName} registered for ${eventsData[eventIndex].name}`);
        return true;
        
    } catch (error) {
        console.error("Registration Error:", error.message);
        alert("Error: " + error.message);
        return false;
    }
}
function displaytable(){
    let tbody = document.querySelector("#eventsTable tbody");
    tbody.innerHTML = ""; // Clear existing rows
    eventsData.forEach((event, index) => {
        let row = `<tr>
            <td>${event.name}</td>
            <td>${event.date}</td>
            <td>${event.seats}</td> 
            <td>${event.category}</td>
            <td>${event.fee}</td>
        </tr>`;
        tbody.innerHTML += row;
    }); 
}
displaytable();