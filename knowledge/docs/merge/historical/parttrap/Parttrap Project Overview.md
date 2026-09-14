---
title: Parttrap Project Overview
type: note
permalink: parttrap/parttrap-project-overview
---

# Parttrap Project Overview

## Context

Large-scale e-commerce platform with multi-application architecture and extensive plugin ecosystem.

## Architecture Summary

### Applications

- **PT.OnlineBusiness** - Customer-facing web application
- **PT.Studio** - Administrative interface and content management
- **PT.Headless** - API-only services for headless commerce

### Core Technologies

- **.NET Framework 4.8** - Primary runtime for web applications
- **.NET 6.0/8.0** - Modern runtime for core libraries (multi-targeting)
- **ASP.NET MVC** - Web application framework
- **Entity Framework 6.5.1** - ORM for data access

## Observations

- [architecture] Multi-application structure with three main apps #ecommerce #architecture
- [pattern] Plugin-based architecture with automatic dependency injection #plugins #ioc
- [data] Repository pattern supporting multiple data sources #repository #data-access
- [integration] Comprehensive ERP support through dedicated implementations #erp #integration
- [build] Multiple solution files for different development scenarios #build #solutions
- [testing] Unit tests and integration tests across multiple projects #testing #quality

## Relations

- implements \[[E-commerce Platform Architecture]\]
- uses \[[Plugin-Based Architecture Pattern]\]
- supports \[[Multiple ERP Systems]\]
- contains \[[PT.OnlineBusiness Application]\]
- contains \[[PT.Studio Application]\]
- contains \[[PT.Headless API Services]\]
- follows \[[Repository Pattern]\]
- uses \[[Dependency Injection Pattern]\]

## Development Commands

### Build Commands

```bash
# Clean all bin/obj folders
./CleanBinAndObj.bat

# Build main solution
msbuild PT.Admin-Dev.sln /p:Configuration=Release
```

### Test Commands

```bash
# Unit tests
dotnet test Tests/PT.One.UnitTests/PT.One.UnitTests.csproj

# Integration tests
dotnet test Tests/PT.One.Json.IntegrationTests/PT.One.Json.IntegrationTests.csproj
```
