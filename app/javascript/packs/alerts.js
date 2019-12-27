import Swal  from 'sweetalert2';
 
let ready = () => {
    const type = $('#notification').data('type');
    const message = $('#notification').data('message');
    const Toast = Swal.mixin({
        toast: true,
        position: 'top-end',
        timer: 3000,
        showConfirmButton: false,
        timerProgressBar: true,
        onOpen: (toast) => {
            toast.addEventListener('mouseenter', Swal.stopTimer);
            toast.addEventListener('mouseleave', Swal.resumeTimer);
        }
    });
 
    Toast.fire({
        icon: type,
        title: message
    })
};
$('document').ready(ready);