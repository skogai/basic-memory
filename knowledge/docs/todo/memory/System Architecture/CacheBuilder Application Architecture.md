---
title: CacheBuilder Application Architecture
type: note
permalink: system-architecture/cache-builder-application-architecture
tags:
  - '#architecture'
  - '#dot-net'
  - '#cachebuilder'
  - '#ecommerce'
---

# CacheBuilder Application Architecture

## Overview

The codebase represents a complex eCommerce/ERP solution with a modular architecture. The system appears to be built on .NET technology with a mix of C# and VB.NET components.

## Key Components

### Core Modules

- **CacheBuilderProfile.Core**: Contains the central business logic and data processing capabilities
- **PT.Core.Model/PT.Core.Model2**: Data models and business entities
- **PT.Core.Service**: Service layer implementation
- **PT.Core.Library**: Shared utilities and helper functions

### Presentation Layer

- **PT.OnlineBusiness**: Main web application for end-users
- **PT.Studio**: Likely an admin or management interface
- **PT.Headless** components: REST API services for headless commerce
- **PT.One.Controllers**: MVC controllers for the application

### Data Access

- **Repository layer**: Multiple repository implementations for different data sources
- Support for multiple database types (SQL Server, SQL Anywhere)
- Various ERP integrations (SAP, Dynamics 365, Epicor, etc.)

### Plugins System

- Modular plugin architecture allowing for extensions
- Authentication plugins supporting multiple providers
- Payment processing plugins for various payment gateways
- File system and document management plugins

### Integration Components

- **PT.Plugin.DocStar**: Document management integration
- **PT.Plugin.EdgeApi**: API integrations
- **PT.Erp.Repository**: Various ERP system integrations

### Cache System

- **CacheBuilder**: Appears to be a core feature for performance optimization
- Docker-based cache implementation with remote capabilities
- Cache profiling and optimization tools

## Architecture Patterns

- Uses dependency injection heavily (Ninject appears to be the DI container)
- Repository pattern for data access
- Plugin system for extensibility
- MVC pattern for web applications

## Development Tools

- Solution files indicate Visual Studio development environment
- NuSpec files for NuGet package management
- Docker support for containerization
