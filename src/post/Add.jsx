import React, { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import {MessageOutlined, FontSizeOutlined} from '@ant-design/icons';


//import addTocChart from "./add";
import axios from "axios";
import { Button, Layout, Input } from 'antd';

const { Header, Content } = Layout;
const { TextArea } = Input;
function Add () {
 const [title, setTitle] = useState('')
 const [body, setBody] = useState('')

  const onPost = async ()=> {
   

    const formData = new FormData()
    formData.append('title', title )
    formData.append('body', body)
    formData.append('usreId', '1')
    
    await axios(`https://jsonplaceholder.typicode.com/posts`, {
        method: 'POST',
        data: formData,
        headers:{
            'Accept': 'application/json',
            'Content-Type': 'application/json',
        }

    })
    setBody('')
    setTitle('')
    alert('Post Added')
    
}

const onPostPost=()=>{
    onPost()
    setBody('')
    setTitle('')
}


  

  return (

    <Layout>
        <Header
        style={{
          display: 'flex',
          alignItems: 'left',
        }}
      >
        <Link to= '/'>{'<-'}Posts List</Link>
      </Header>
      <Content
      style={{marginLeft: '20px', alignItems: 'center'}}>
    <p>
    <MessageOutlined/>
    <Input value={title} placeholder="input with clear icon" allowClear onChange={(e)=> setTitle(e.currentTarget.value)} style={{width: '300px', marginLeft: '20px' }}/>
    </p>
    <p>
    <FontSizeOutlined /><></>
    <TextArea value={body} placeholder="textarea with clear icon" allowClear onChange={(e)=> setBody(e.currentTarget.value)} style={{width: '300px', marginLeft: '20px'}}/>
    </p>
    
    <Button  type="primary" onClick={()=>onPostPost()} style={{marginLeft: '200px', marginBottom: '380px'}}>ADD COMMENT</Button>
    </Content>
  </Layout>
    
  )

}


export default Add;
