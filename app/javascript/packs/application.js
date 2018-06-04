import "bootstrap";
// import "../components/navbar";
import { getLocation } from "./getlocation.js";
import { initBarrating } from "./barrating.js" ;

initBarrating();
import 'jquery-bar-rating/dist/themes/bars-1to10.css';

const checkin = document.getElementById("checkin")
checkin.addEventListener("click", getLocation)
