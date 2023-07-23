import React from 'react';
import { Link, NavLink, Navigate } from 'react-router-dom';
import {useState, useEffect} from 'react';
import {MessageOutlined, PlusCircleFilled } from '@ant-design/icons';
//import addTocChart from "./add";
// import axios from "axios";
// import { Navbar } from 'react-bootstrap';
import { Button, Layout, List, Space } from 'antd';
import './post.css'

const { Header, Content } = Layout;



function Add () {
  
  
  const [items, setItems] = useState([])
  const [pressed, setPressed] = useState(false)

  const onChartAdd =(e) =>
  {
    e.preventDefault(); 
    
  }
   
   




  async function fetchData() {
    try {
      const response = await fetch("https://jsonplaceholder.typicode.com/posts", {
        method: "GET"
      });
      const result = await response.json();
      setItems(result);
      console.log(result);
    } catch (error) {
      console.error(error);
    }
  }
  
  useEffect(() => {
    fetchData();
  }, [pressed]);

 
 

if (pressed===false){
return(
  
  <Layout> 
    <Header
        style={{
          display: 'flex',
          alignItems: 'left',
        }}
      >
        <Link to= '/add'>{'<-'}Add new user</Link>
      </Header>
    <Content>
        
    <Button type="primary" onClick={()=>setPressed(!pressed)} style={{marginTop: '200px',marginBottom: '400px',marginLeft: '560px' }}>
        press me
    </Button>
    
    </Content>
    
  </Layout>
)}
    else

  return (

    <Layout>
        
        <Link to='/add' style={{ position: 'fixed', top: '10px', right: '10px' }} >
       <Button  type='link'  >
            <PlusCircleFilled  style={{fontSize: '250%',}} />

         </Button>
         </Link>
       
        <Header
        style={{
          display: 'flex',
          alignItems: 'left',
        }}
      >
        <Link to= '/add'>{'<-'}Add new user</Link>
      </Header>
      
        <Content style={{marginLeft: '10px'}} >

       
         
         <List
        dataSource={items}
        renderItem={(item, index) => (
          <List.Item >
            <List.Item.Meta
              avatar={<MessageOutlined />}
              title={item.title}
              description={item.body}
            />
          </List.Item>
        )}
      />
      

        </Content>
    </Layout>

)
}

export default Add;
