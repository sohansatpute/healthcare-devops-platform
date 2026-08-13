import Navbar from "./components/Navbar";
import Hero from "./components/Hero";
import Stats from "./components/Stats";
import Services from "./components/Services";
import Doctors from "./components/Doctors";
import AppointmentCTA from "./components/AppointmentCTA";
import Footer from "./components/Footer";
import "./App.css";

function App() {
  return (
    <>
      <Navbar />
      <Hero />
      <Stats />
      <Services />
      <Doctors />
      <AppointmentCTA />
      <Footer />
    </>
  );
}

export default App;