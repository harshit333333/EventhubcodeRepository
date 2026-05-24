# Use Playwright's official image to include Node, browsers, and required OS deps.
FROM mcr.microsoft.com/playwright:latest

WORKDIR /usr/src/app

# Install only the root dependencies needed for Playwright tests.
COPY package.json package-lock.json ./
RUN npm ci

# Copy the repository into the container.
COPY . ./

# Install Playwright browsers for the installed @playwright/test version.
RUN npx playwright install --with-deps

# Default command runs the root Playwright test suite.
CMD ["npm", "test"]
