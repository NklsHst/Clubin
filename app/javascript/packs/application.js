import "bootstrap";
// import "../components/navbar";
import { getLocation } from "./getlocation.js";


const checkin = document.getElementById("checkin")
checkin.addEventListener("click", getLocation)
