import React, { useState, useEffect } from 'react';
import api from '../api';
import { useNavigate } from 'react-router-dom';

const Dashboard = () => {
  const [formData, setFormData] = useState({
    companyName: '',
    email: '',
    salary: '',
    description: ''
  });
  const [analysisResult, setAnalysisResult] = useState(null);
  const [jobs, setJobs] = useState([]);
  const [message, setMessage] = useState('');
  const [isError, setIsError] = useState(false);
  const navigate = useNavigate();

  useEffect(() => {
    // Check if user is logged in
    const user = localStorage.getItem('user');
    if (!user) {
      navigate('/login');
      return;
    }

    // Fetch all jobs
    fetchJobs();
  }, [navigate]);

  const fetchJobs = async () => {
    try {
      const response = await api.get('/api/jobs');
      setJobs(response.data);
    } catch (error) {
      console.error('Error fetching jobs:', error);
    }
  };

  const handleChange = (e) => {
    setFormData({
      ...formData,
      [e.target.name]: e.target.value
    });
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    setMessage('');
    setAnalysisResult(null);

    try {
      const response = await api.post('/api/jobs/analyze', {
        ...formData,
        salary: parseFloat(formData.salary)
      });
      
      setAnalysisResult(response.data);
      setIsError(false);
      
      // Refresh jobs list
      fetchJobs();
      
      // Clear form
      setFormData({
        companyName: '',
        email: '',
        salary: '',
        description: ''
      });
    } catch (error) {
      setMessage(error.response?.data?.message || 'Job analysis failed');
      setIsError(true);
    }
  };

  const handleLogout = () => {
    localStorage.removeItem('user');
    navigate('/login');
  };

  const getStatusClass = (status) => {
    return status.toLowerCase();
  };

  return (
    <div className="container">
      <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: '30px' }}>
        <h1>Job Detector Dashboard</h1>
        <button className="btn btn-secondary" onClick={handleLogout}>
          Logout
        </button>
      </div>

      <div className="form-container">
        <h2>Analyze Job Offer</h2>
        <form onSubmit={handleSubmit}>
          <div className="form-group">
            <label htmlFor="companyName">Company Name</label>
            <input
              type="text"
              id="companyName"
              name="companyName"
              value={formData.companyName}
              onChange={handleChange}
              required
            />
          </div>
          <div className="form-group">
            <label htmlFor="email">Email</label>
            <input
              type="email"
              id="email"
              name="email"
              value={formData.email}
              onChange={handleChange}
              required
            />
          </div>
          <div className="form-group">
            <label htmlFor="salary">Salary</label>
            <input
              type="number"
              id="salary"
              name="salary"
              value={formData.salary}
              onChange={handleChange}
              required
            />
          </div>
          <div className="form-group">
            <label htmlFor="description">Description</label>
            <textarea
              id="description"
              name="description"
              value={formData.description}
              onChange={handleChange}
              required
            />
          </div>
          <button type="submit" className="btn">Analyze Job</button>
        </form>

        {message && (
          <div className={isError ? 'error' : 'success'}>
            {message}
          </div>
        )}

        {analysisResult && (
          <div className={`result-container ${getStatusClass(analysisResult.status)}`}>
            <h3>Analysis Result</h3>
            <div className="risk-score">Risk Score: {analysisResult.riskScore}</div>
            <div>
              <span className={`status-badge ${getStatusClass(analysisResult.status)}`}>
                {analysisResult.status}
              </span>
            </div>
          </div>
        )}
      </div>

      <div className="jobs-list">
        <h2>Previous Job Analyses</h2>
        {jobs.length === 0 ? (
          <p>No jobs analyzed yet.</p>
        ) : (
          jobs.map((job) => (
            <div key={job.id} className={`job-item ${getStatusClass(job.status)}`}>
              <h3>{job.companyName}</h3>
              <p><strong>Email:</strong> {job.email}</p>
              <p><strong>Salary:</strong> ${job.salary.toLocaleString()}</p>
              <p><strong>Description:</strong> {job.description}</p>
              <div>
                <span className={`status-badge ${getStatusClass(job.status)}`}>
                  {job.status}
                </span>
                <span style={{ marginLeft: '10px', fontWeight: 'bold' }}>
                  Risk Score: {job.riskScore}
                </span>
              </div>
            </div>
          ))
        )}
      </div>
    </div>
  );
};

export default Dashboard;
