// Mobile Menu Toggle Functionality
document.addEventListener('DOMContentLoaded', function() {
    const mobileMenuToggle = document.querySelector('.mobile-menu-toggle');
    const mobileMenu = document.querySelector('.mobile-menu');
    const body = document.body;

    // Create mobile menu if it doesn't exist
    if (!mobileMenu && mobileMenuToggle) {
        const nav = document.querySelector('.navbar');
        const navLinks = nav.querySelector('ul');
        
        if (navLinks) {
            // Clone the navigation links for mobile menu
            const mobileMenuEl = document.createElement('div');
            mobileMenuEl.className = 'mobile-menu';
            mobileMenuEl.innerHTML = `
                <div class="mobile-menu-content">
                    ${navLinks.outerHTML}
                </div>
            `;
            
            // Insert mobile menu after header
            const header = document.querySelector('header');
            header.appendChild(mobileMenuEl);
        }
    }

    // Toggle mobile menu
    if (mobileMenuToggle) {
        mobileMenuToggle.addEventListener('click', function() {
            const mobileMenu = document.querySelector('.mobile-menu');
            
            // Toggle active class on hamburger
            mobileMenuToggle.classList.toggle('active');
            
            // Toggle mobile menu visibility
            if (mobileMenu) {
                mobileMenu.classList.toggle('active');
            }
            
            // Prevent body scroll when menu is open
            body.classList.toggle('mobile-menu-open');
        });
    }

    // Close mobile menu when clicking on links
    document.addEventListener('click', function(e) {
        if (e.target.matches('.mobile-menu a')) {
            const mobileMenu = document.querySelector('.mobile-menu');
            const mobileMenuToggle = document.querySelector('.mobile-menu-toggle');
            
            if (mobileMenu) {
                mobileMenu.classList.remove('active');
            }
            if (mobileMenuToggle) {
                mobileMenuToggle.classList.remove('active');
            }
            body.classList.remove('mobile-menu-open');
        }
    });

    // Close mobile menu when clicking outside
    document.addEventListener('click', function(e) {
        const mobileMenu = document.querySelector('.mobile-menu');
        const mobileMenuToggle = document.querySelector('.mobile-menu-toggle');
        
        if (mobileMenu && 
            mobileMenu.classList.contains('active') && 
            !e.target.closest('.mobile-menu') && 
            !e.target.closest('.mobile-menu-toggle')) {
            
            mobileMenu.classList.remove('active');
            if (mobileMenuToggle) {
                mobileMenuToggle.classList.remove('active');
            }
            body.classList.remove('mobile-menu-open');
        }
    });
});
