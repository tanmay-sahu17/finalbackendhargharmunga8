# Harghar Backend - Production Deployment Guide

## 🚀 Production Configuration

### Current Status: ✅ PRODUCTION MODE ENABLED

## 📊 Production Settings

### Database Configuration:
- **Host**: 127.0.0.1
- **Database**: hgm (Production Database)
- **User**: root
- **Password**: Ssipmt@2025DODB

### Server Configuration:
- **Host**: 0.0.0.0 (All interfaces)
- **Port**: 5001
- **Debug**: False (Production Safe)
- **Threading**: Enabled
- **CORS**: Restricted to specific domains

### Security Features:
- ✅ Debug mode disabled
- ✅ Production database credentials
- ✅ CORS restricted to specific domains
- ✅ Error handling and logging
- ✅ Health check endpoint
- ✅ Threaded request handling

## 🔧 Deployment Steps

### 1. Server Setup
```bash
# Clone repository
git clone https://github.com/tanmay-sahu17/finalbackendhargharmunga8.git
cd finalbackendhargharmunga8

# Install dependencies
pip install -r requirements.txt

# Create uploads directory
mkdir uploads
chmod 755 uploads
```

### 2. Database Setup
```sql
-- Create production database
CREATE DATABASE hgm;

-- Import your existing data
-- Make sure tables: students, users, student_uploads exist
```

### 3. Start Production Server
```bash
# Direct Python execution
python server.py

# Or using gunicorn (recommended)
pip install gunicorn
gunicorn -w 4 -b 0.0.0.0:5001 server:app
```

### 4. Nginx Configuration (Optional)
```nginx
server {
    listen 80;
    server_name yourdomain.com;

    location / {
        proxy_pass http://127.0.0.1:5001;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
    }

    location /photo/ {
        proxy_pass http://127.0.0.1:5001;
        add_header Cache-Control "public, max-age=3600";
    }
}
```

## 🔍 Health Monitoring

### Health Check Endpoint:
- **URL**: `http://yourdomain.com:5001/health`
- **Method**: GET
- **Response**: System status, database connectivity, upload folder status

### Example Health Check Response:
```json
{
    "status": "healthy",
    "timestamp": "2025-08-13T00:50:00",
    "database": "connected",
    "upload_folder": "exists",
    "mode": "production",
    "version": "1.0.0"
}
```

## 📱 API Endpoints

### Core Endpoints:
- `GET /health` - System health check
- `GET /api/photos/all` - Get all student photos
- `GET /photo/<filename>` - Serve photo files
- `POST /upload_plant_photo` - Mobile app uploads
- `GET /searchAng` - Anganwadi workers data
- `GET /api/analytics/centers-overview` - Analytics data

### CORS Configuration:
- **Production**: Restricted to specific domains
- **Mobile Uploads**: Allowed from all origins
- **API Access**: Domain-restricted

## 🛡️ Security Features

### Production Safety:
1. **Database Isolation**: Separate production database (hgm)
2. **CORS Protection**: Domain-restricted access
3. **Error Handling**: Proper exception handling
4. **Logging**: Comprehensive application logging
5. **Input Validation**: Secure file uploads
6. **Threading**: Concurrent request handling

### File Upload Security:
- Secure filename generation
- File type validation
- Upload directory isolation
- Size limitations

## 📝 Logging

### Log Files:
- **Application Log**: `harghar_app.log`
- **Console Output**: Real-time monitoring
- **Format**: Timestamp, Level, Message

### Log Levels:
- **INFO**: Application events
- **ERROR**: Error conditions
- **DEBUG**: Development debugging (disabled in production)

## 🔄 Maintenance

### Regular Tasks:
1. **Database Backup**: Regular backups of production data
2. **Log Rotation**: Manage log file sizes
3. **Upload Cleanup**: Monitor upload folder size
4. **Health Monitoring**: Regular health check monitoring

### Updates:
```bash
# Pull latest changes
git pull origin master

# Restart application
# (Use process manager like PM2 or systemd)
```

## 📞 Support

For production support and issues:
- Check health endpoint first
- Review application logs
- Verify database connectivity
- Monitor upload folder permissions

## 🚀 Production Ready!

The backend is now configured for production deployment with:
- ✅ Production database connection
- ✅ Security configurations
- ✅ Error handling and logging
- ✅ Health monitoring
- ✅ Photo upload and serving functionality
