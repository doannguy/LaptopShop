import axios from 'axios';
import { GoogleGenerativeAI } from "@google/generative-ai";




const genAI = new GoogleGenerativeAI("AIzaSyDK14TUePjNrJzHdn7qcbVwCbZZ4hoTXCk");
const model = genAI.getGenerativeModel({ model: "gemini-1.5-flash" });



// Tạo một yêu cầu POST với nội dung chat
export const postDataToGemini = async ({ messenger = {}, data = {} } = {}) => {
    const prompt = messenger;
    const result = await model.generateContent(prompt);
    const response = await result.response;
    const text = response.text();
    console.log(text);
    return text;
};