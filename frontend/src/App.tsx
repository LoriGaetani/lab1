import './App.css'

function App() {
    const frontendVersion = import.meta.env.VITE_FRONTEND_VERSION;
    return (
        <div className="app-container">
            <header className="header">
                <h1>Cloud Programming and Operations 2025-26</h1>
                <p>Lab 01</p>
            </header>
            <div style={{
                flex: 1,
                display: 'flex',
                flexDirection: 'column',
                justifyContent: 'center',
                alignItems: 'center'
            }}>
                <main className="main-content">
                    <div className="version-card">
                        <p>version {frontendVersion}</p>
                    </div>
                    <a href="./report" className="btn">Report</a>
                </main>
            </div>
        </div>
)
}

export default App
