import React from 'react';
import PropTypes from 'prop-types';
import Item from './Item'

class ReceiptList extends React.Component {
  constructor(props) {
    super(props);
    this.render = this.render.bind(this);
    this.state = {receipts: []};
  }

  componentDidMount() {
    fetch("query/0/", { credentials: 'same-origin' })
      .then((response) => {
      console.log(response);
        if(!response.ok) throw Error(response.statusText);
        return response.json();
      })   
    .then((data) => {
      console.log(data);
      this.setState({receipts: data,});
    })
    .catch(error => console.log(error)); 


  }

  render() {
    const receipts = this.state.receipts.map(p =>
        <Receipt store={p.store} price={0}/>,
        );

    return (
        <div>
        {receipts}
        </div>
        );
  };
}

export default ReceiptList;
