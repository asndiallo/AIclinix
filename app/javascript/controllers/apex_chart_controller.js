import { Controller } from '@hotwired/stimulus';
import ApexCharts from 'apexcharts';

// Connects to data-controller="apex-chart"
export default class extends Controller {
  static values = { shapData: Array };

  connect() {
    try {
      const shapValues = this.shapDataValue.map((data) => data.shap_value);
      const featureNames = this.shapDataValue.map((data) => data.feature_name);

      const options = {
        series: [
          {
            name: 'SHAP value',
            data: shapValues,
          },
        ],
        chart: {
          type: 'bar',
          height: 350,
        },
        plotOptions: {
          bar: {
            horizontal: true,
          },
        },
        dataLabels: {
          enabled: false,
        },
        xaxis: {
          categories: featureNames,
        },
        yaxis: {
          title: {
            text: 'Feature Impact',
          },
        },
        title: {
          text: 'Patient Feature Impact (SHAP Values)',
          align: 'center',
          floating: false,
          style: {
            fontSize: '14px',
            fontWeight: 'bold',
            color: '#263238',
          },
        },
        // ... more options as needed for our chart ...
      };

      const chart = new ApexCharts(this.element, options);
      chart.render();
    } catch (error) {
      console.error('Error rendering SHAP value chart:', error);
    }
  }
}
