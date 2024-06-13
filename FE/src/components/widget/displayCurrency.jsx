function Currency({currency}) {
    return ( 
        <span className="currency">  {new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(currency)}</span>
     );
}

export default Currency;