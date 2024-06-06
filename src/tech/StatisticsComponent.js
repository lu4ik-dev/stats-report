import React from 'react';
import { Pie, Line } from 'react-chartjs-2';
import 'chart.js/auto';

const StatisticsComponent = ({ statistics }) => {
  const totalAllTimeCount = statistics.totalStatistics.totalAllTimeCount;
  const allTimeUniqueUsers = statistics.totalStatistics.allTimeUniqueUsers - 1;
  const totalYear2023Count = statistics.totalStatistics.totalYear2023Count - 1;
  const users2023 = statistics.totalStatistics.users2023 +1;
  const totalYear2024Count = statistics.totalStatistics.totalYear2024Count;
  const users2024 = statistics.totalStatistics.users2023 - 1;

  const allTimeData = {
    labels: ['Отчетов принято', 'Респондентов отчиталось'],
    datasets: [
      {
        data: [totalAllTimeCount, allTimeUniqueUsers],
        backgroundColor: ['#35A0BE', '#bb2d25'],
        hoverBackgroundColor: ['#35A0BE', '#bb2d25']
      }
    ]
  };

  const year2023Data = {
    labels: ['Отчетов принято', 'Респондентов отчиталось'],
    datasets: [
      {
        data: [totalYear2023Count, users2023],
        backgroundColor: ['#35A0BE', '#bb2d25'],
        hoverBackgroundColor: ['#35A0BE', '#bb2d25']
      }
    ]
  };

  const year2024Data = {
    labels: ['Отчетов принято', 'Респондентов отчиталось'],
    datasets: [
      {
        data: [totalYear2024Count, users2024],
        backgroundColor: ['#35A0BE', '#bb2d25'],
        hoverBackgroundColor: ['#35A0BE', '#bb2d25']
      }
    ]
  };

  const lineData = {
    labels: ['Все время', '2023', '2024'],
    datasets: [
      {
        label: 'Отчетов принято',
        data: [totalAllTimeCount, totalYear2023Count, totalYear2024Count],
        fill: false,
        backgroundColor: '#35A0BE',
        borderColor: '#35A0BE'
      },
      {
        label: 'Респондентов отчиталось',
        data: [allTimeUniqueUsers, users2023, users2024],
        fill: false,
        backgroundColor: '#bb2d25',
        borderColor: '#bb2d25'
      }
    ]
  };

  return (
    <div className="statistics-container">
      <div className="me-4">
        <h6 className="card-title">Статистика за все время</h6>
        <Pie data={allTimeData} />
      </div>
      <div>
        <h6 className="card-title">Статистика за текущий год</h6>
        <Pie data={year2023Data} />
      </div>
      <div className="ms-4">
        <h6 className="card-title">Статистика за 2024 год</h6>
        <Pie data={year2024Data} />
      </div>
      <div className="graph-container">
        <h6 className="card-title">Графики</h6>
        <Line data={lineData} />
      </div>
    </div>
  );
};

export default StatisticsComponent;
