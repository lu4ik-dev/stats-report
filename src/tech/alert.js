export const showAlert = (message) => {
  const alertDiv = document.createElement('div');
  const liveToast = document.createElement('div');
  liveToast.id = 'liveToast';
  liveToast.classList.add('toast');
  liveToast.classList.add('d-block');
  liveToast.classList.add('position-fixed', 'bottom-0', 'end-0', 'p-1');
  liveToast.style.zIndex = '11';
  liveToast.setAttribute('role', 'alert');
  liveToast.setAttribute('aria-live', 'assertive');
  liveToast.setAttribute('aria-atomic', 'true');

  const toastHeader = document.createElement('div');
  toastHeader.classList.add('toast-header');

  const portalLogo = document.createElement('img');
  portalLogo.src = '/logo192.png'; 
  portalLogo.width = 20;
  portalLogo.height = 20;
  portalLogo.classList.add('rounded', 'me-2');

  const strongElement = document.createElement('strong');
  strongElement.classList.add('me-auto');
  strongElement.textContent = 'Портал статистической отчетности';

  const smallElement = document.createElement('small');
  smallElement.id = 'toastTimestamp';

  const closeButton = document.createElement('button');
  closeButton.type = 'button';
  closeButton.classList.add('btn-close');
  closeButton.setAttribute('data-bs-dismiss', 'toast');
  closeButton.setAttribute('aria-label', 'Закрыть');

  const toastBody = document.createElement('div');
  toastBody.classList.add('toast-body');
  toastBody.classList.add('bg-lite-light');
  toastBody.classList.add('text-black');
  toastBody.id = 'toastMessage';
  toastBody.textContent = message;

  toastHeader.appendChild(portalLogo);
  toastHeader.appendChild(strongElement);
  toastHeader.appendChild(smallElement);
  toastHeader.appendChild(closeButton);

  liveToast.appendChild(toastHeader);
  liveToast.appendChild(toastBody);

  alertDiv.appendChild(liveToast);

  document.getElementById('footer').appendChild(alertDiv);

  const currentTime = new Date();
  const hours = currentTime.getHours().toString().padStart(2, '0');
  const minutes = currentTime.getMinutes().toString().padStart(2, '0');
  smallElement.textContent = ` ${hours}:${minutes}`;

  setTimeout(() => {
    alertDiv.remove();
  }, 2000);
};
