import React from 'react';
import PropTypes from 'prop-types';

class Item extends React.Component {
  constructor(props) {
    super(props);
    this.render = this.render.bind(this);
    this.state = {name: "", price: "0"};
  }

  componentDidMount() {

  }

  render() {
    let name = this.state.name;
    let price = this.state.price;

    return (
        {name}, {price}
        );
  };
}

Item.propTypes = {
  name: PropTypes.string.isRequired,
};

export default Item;
