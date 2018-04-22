import React from 'react';
import PropTypes from 'prop-types';

class Receipt extends React.Component {
  constructor(props) {
    super(props);
    this.render = this.render.bind(this);
    this.state = {name: this.props.name, price: this.props.price};
  }

  componentDidMount() {

  }

  render() {
    let name = this.state.name;
    let price = this.state.price;

    return (
        <p>Name: <span className="pink-text text-accent-2">{name}</span>, Price:<span className="purple-text text-accent-2"> {price} </span> </p> 
        );
  };
}

Receipt.propTypes = {
  name: PropTypes.string.isRequired,
  price: PropTypes.number.isRequired,
};

export default Receipt;
