import ReactLoading from 'react-loading';

const Loading = () => {
    return ( <div style={{ 
        position: 'fixed', 
        top: 0, 
        right: 0, 
        bottom: 0, 
        left: 0, 
        zIndex: 99999999,
        display: 'flex',
        justifyContent: 'center',
        alignItems: 'center',
     }}>
        <ReactLoading height={'5%'} width={'5%'} type="spokes" color="#3572EF" />
    </div> );
}
 
export default Loading;