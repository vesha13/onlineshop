import { Routes, Route } from "react-router-dom";

import'./App.css'
import React from "react";
import { BrowserRouter } from 'react-router-dom';

import Post from "./post/Posts";
import Add from './post/Add'
function App() {

  return (
    <BrowserRouter>
    
    <Routes>
    <Route path="/"element ={<Post/>}/>
    <Route path="/add"element ={<Add/>}/>
    </Routes>
    
   
   
    </BrowserRouter>

  );
}

export default App;
