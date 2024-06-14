import { useEffect, useState } from 'react';
import ReactLoading from 'react-loading';

const Loading = () => {
    const [showLoading, setShowLoading] = useState(true);
    
    useEffect(() => {
        const timer = setTimeout(() => {
            setShowLoading(true);
        }, 30000);
        return () => clearTimeout(timer);
    }, []);

    if (!showLoading) {
        return (
            <div style={{ 
                color: 'red',
             }}>
                <h3>Không kết nối internet</h3>
                <p>Vui lòng kiểm tra lại kết nối internet</p>
            </div>
        );
    }

    return (
        <div style={{ 
            position: 'fixed', 
            top: 0, 
            right: 0, 
            bottom: 0, 
            left: 0, 
            zIndex: 99999999,
            display: 'flex',
            backgroundColor: 'rgba(255, 255, 255)',
            justifyContent: 'center',
            alignItems: 'center',
        }}>
            <ReactLoading height={'5%'} width={'5%'} type="spokes" color="#3572EF" />
        </div>
    );
}
 
export default Loading;