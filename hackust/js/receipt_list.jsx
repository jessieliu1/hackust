import React from 'react';
import PropTypes from 'prop-types';
import Receipt from './receipt'

class ReceiptList extends React.Component {
  constructor(props) {
    super(props);
    this.render = this.render.bind(this);
    this.price_total = this.price_total.bind(this);
    this.state = {receipts: []};
  }


  componentDidMount() {
    fetch('query/', { credentials: 'same-origin' })
      .then((response) => {
        if(!response.ok) throw Error(response.statusText);
        return response.json();
      })   
    .then((data) => {
      this.setState({receipts: data,});
    })
    .catch(error => console.log(error)); 
  }

  price_total(receipt) {
    let total = 0;
    receipt.items.forEach(i =>
        total+=i.price);
    // round to two decimal places
    total = Math.round(total*100) / 100; 
    return total;
  }

  render() {
    const receipts = this.state.receipts.map(p =>
        <Receipt key={p.receipt_id} name={p.store} price={this.price_total(p)}/>
        );

    return (
        <div id="receipts_list" className="container card card blue-grey lighten-5">
          <h3>Past Receipts</h3>
          {receipts}
        </div>
        );
  };
}

export default ReceiptList;
