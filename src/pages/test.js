import React, { useState, useEffect } from 'react';
import { url_api } from '../tech/config';


const Testiq = () => {
  const [enrollmentData, setEnrollmentData] = useState([]);

  useEffect(() => {
    fetch(url_api+'/enrollment_body')
      .then(response => {
        if (!response.ok) {
          throw new Error(`HTTP error! Status: ${response.status}`);
        }
        return response.json();
      })
      .then(data => {
        setEnrollmentData(data);
      })
      .catch(error => {
        console.error('Error fetching data:', error);
      });
  }, []);

  return (
    <div>
      <h2>Enrollment Data</h2>
      <table>
        <thead>
          <tr>
            <th>ID</th>
            {/* Add other table headers based on your API response structure */}
          </tr>
        </thead>
        <tbody>
          {enrollmentData.map(item => (
            <tr key={item.id}>
              <td>{item.id}</td>
              {/* Add other table cells based on your API response structure */}
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
};

export default Testiq;