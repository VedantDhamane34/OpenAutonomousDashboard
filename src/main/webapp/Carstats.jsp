<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Charging & Fueling Stats</title>
    <style>
        body {
          margin: 0;
          padding: 0;
          font-family: Arial, sans-serif;
          background-color: #000;
          color: #fff;
        }
        .container {
          max-width: 800px;
          margin: 0 auto;
          margin-top:5%;
          padding: 20px;
          position: relative; /* Make container relative for absolute positioning */
        }
        h1 {
          text-align: center;
        }
        canvas {
          display: block;
          margin: 0 auto;
        }
        .tabs {
          display: flex;
          justify-content: center;
          margin-bottom: 20px;
        }
        .tab {
          padding: 10px 20px;
          margin: 0 10px;
          cursor: pointer;
          border-radius: 5px;
          transition: background-color 0.3s;
        }
        .tab.active {
          background-color: #555;
        }
        .graph-container {
          background-color: rgba(255, 255, 255, 0.1);
          padding: 20px;
          border-radius: 10px;
          margin-bottom: 20px;
        }
        .total-cost {
          position: absolute;
          top: 20px;
          right: 20px;
          background-color: rgba(255, 255, 255, 0.1);
          padding: 10px 20px;
          border-radius: 5px;
          margin-left:80%;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Charging & Fueling Stats</h1>

    <div class="total-cost" id="totalCost">
        Total Cost This Week: 150 Rupees <!-- Replace with actual value -->
    </div>

    <div class="tabs">
        <div class="tab active" id="weekTab">Week</div>
        <div class="tab" id="monthTab">Month</div>
    </div>

    <div class="graph-container">
        <canvas id="statsChart" width="600" height="400"></canvas>
    </div>
</div>

<!-- Chart.js library -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function() {
      var ctx = document.getElementById('statsChart').getContext('2d');
      var weekTab = document.getElementById('weekTab');
      var monthTab = document.getElementById('monthTab');
      var totalCost = document.getElementById('totalCost');
      var chart;

      weekTab.addEventListener('click', function() {
        weekTab.classList.add('active');
        monthTab.classList.remove('active');

        updateChart('week');
      });

      monthTab.addEventListener('click', function() {
        monthTab.classList.add('active');
        weekTab.classList.remove('active');

        updateChart('month');
      });

      function updateChart(interval) {
        if (chart) {
          chart.destroy();
        }

        var ctx = document.getElementById('statsChart').getContext('2d');

        var labels, data, total;
        if (interval === 'week') {
          labels = ['Day 1', 'Day 2', 'Day 3', 'Day 4', 'Day 5', 'Day 6', 'Day 7'];
          data = [150, 140, 120, 145, 155, 250, 160]; // Sample data for fuel/battery cost for each day
          total = data.reduce((acc, curr) => acc + curr, 0); // Calculate total for the week
        } else if (interval === 'month') {
          labels = ['Week 1', 'Week 2', 'Week 3', 'Week 4'];
          data = [1400, 1360, 1280, 1120]; // Sample data for fuel/battery cost for each week
          total = data.reduce((acc, curr) => acc + curr, 0); // Calculate total for the month
        }

        chart = new Chart(ctx, {
          type: 'bar',
          data: {
            labels: labels,
            datasets: [{
              label: 'Fuel/Battery Cost',
              data: data,
              backgroundColor: [
                'rgba(255, 99, 132, 0.7)',
                'rgba(54, 162, 235, 0.7)',
                'rgba(255, 206, 86, 0.7)',
                'rgba(75, 192, 192, 0.7)',
                'rgba(153, 102, 255, 0.7)',
                'rgba(255, 159, 64, 0.7)',
                'rgba(255, 99, 132, 0.7)'
              ],
              borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)',
                'rgba(255, 99, 132, 1)'
              ],
              borderWidth: 1
            }]
          },
          options: {
            scales: {
              yAxes: [{
                ticks: {
                  beginAtZero: true
                }
              }]
            },
            tooltips: {
              callbacks: {
                label: function(tooltipItem, data) {
                  return tooltipItem.yLabel + ' Rupees ';
                }
              }
            }
          }
        });

        if (interval === 'week') {
          totalCost.textContent = "Total Cost This Week: Rupees " + total; // Update total cost for week
        } else {
          totalCost.textContent = "Total Cost This Month: Rupees " + total; // Update total cost for month
        }
      }

      updateChart('week');
    });
</script>
</body>
</html>
