//    Debugging / Console Logs   
console.log("Portal script loaded successfully.");
console.log("Use Chrome DevTools > Sources to set breakpoints on any function below.");

//    Before Unload Warning   
window.onbeforeunload = function() {
    let name = document.getElementById("name").value;
    let email = document.getElementById("email").value;
    if (name !== "" || email !== "") {
        return "You have unsaved changes. Are you sure you want to leave?";
    }
};

//    Storage: Save & Retrieve Preferences   
function saveit() {
    let eventType = document.getElementById("eventtype").value;
    if (eventType) {
        localStorage.setItem("selectedEvent", eventType);
        sessionStorage.setItem("selectedEvent", eventType);
        console.log("Saved preference:", eventType);
    }
}

window.onload = function() {
    let data = localStorage.getItem("selectedEvent");
    if (data) {
        document.getElementById("eventtype").value = data;
        showFee(); // Update fee display on load
    }
    console.log("Page loaded. Retrieved localStorage:", data);
};

function clearsaved() {
    localStorage.clear();
    sessionStorage.clear();
    document.getElementById("eventtype").value = "";
    document.getElementById("feeDisplay").value = "";
    alert("All saved preferences have been cleared.");
    console.log("localStorage and sessionStorage cleared.");
}

//    Event Fee Display (onchange)   
function showFee() {
    let select = document.getElementById("eventtype");
    let selectedOption = select.options[select.selectedIndex];
    let fee = selectedOption.getAttribute("data-fee");
    let output = document.getElementById("feeDisplay");
    if (fee) {
        output.innerHTML = "Event Fee: " + fee;
    } else {
        output.innerHTML = "";
    }
}

//    Form Submission (onclick confirmation)   
function showmsgs(event) {
    event.preventDefault();
    let name = document.getElementById("name").value;
    document.getElementById("result").innerHTML = "Thank you, " + name + "! Your registration was submitted successfully.";
    console.log("Form submitted for:", name);
}

//    Phone Validation (onblur)   
function validate() {
    let phone = document.getElementById("phonenumber").value;
    let output = document.getElementById("phoneResult");
    if (phone.length === 10 && !isNaN(phone)) {
        output.innerHTML = "Valid Phone Number";
        output.style.color = "green";
    } else {
        output.innerHTML = "Enter a valid 10-digit phone number";
        output.style.color = "red";
    }
}

//    Character Counter (keyboard events)   
function countChars() {
    let text = document.getElementById("feedback").value;
    document.getElementById("charCount").innerHTML = "Characters: " + text.length;
}

//    Image Enlarge (ondblclick)   
function enlargeImage() {
    let img = document.getElementById("eventImg");
    if (img.style.width === "400px") {
        img.style.width = "200px";
    } else {
        img.style.width = "400px";
    }
}

//    Video Ready (oncanplay)   
function videoReady() {
    document.getElementById("videoResult").innerHTML = "Video ready to play!";
    console.log("Video canplay event fired.");
}

//    Geolocation   
function findNearbyEvents() {
    let output = document.getElementById("locationOutput");

    if (!navigator.geolocation) {
        output.innerHTML = "Geolocation is not supported by your browser.";
        return;
    }

    output.innerHTML = "Locating you...";

    let options = {
        enableHighAccuracy: true,
        timeout: 10000,
        maximumAge: 0
    };

    navigator.geolocation.getCurrentPosition(
        function(position) {
            let lat = position.coords.latitude;
            let lon = position.coords.longitude;
            let acc = position.coords.accuracy;
            output.innerHTML = 
                "Your Location:<br>" +
                "Latitude: " + lat.toFixed(6) + "<br>" +
                "Longitude: " + lon.toFixed(6) + "<br>" +
                "Accuracy: " + acc.toFixed(1) + " meters<br>" +
                "<em>Nearest event center is 2.4 km away.</em>";
            console.log("Geolocation success:", lat, lon);
        },
        function(error) {
            let msg = "Error: ";
            switch(error.code) {
                case error.PERMISSION_DENIED:
                    msg += "Permission denied.";
                    break;
                case error.POSITION_UNAVAILABLE:
                    msg += "Position unavailable.";
                    break;
                case error.TIMEOUT:
                    msg += "Request timed out.";
                    break;
                default:
                    msg += "Unknown error.";
            }
            output.innerHTML = msg;
            console.error("Geolocation error:", msg);
        },
        options
    );
}
let flag = false;
function enlarge(id) {
    if (flag) {
        document.getElementById(id).style.width = "200px";
        document.getElementById(id).style.height = "200px";
    } else {
    document.getElementById(id).style.width = "400px";
    document.getElementById(id).style.height = "400px";
}                                                      
flag = !flag;
}