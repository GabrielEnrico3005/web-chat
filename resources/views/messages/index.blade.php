@extends('layouts.app')

@section('title', 'Chat with ' . $receiver->name)

@section('content')
    <div class="container py-4">
        <h3>{{ __('Chat with') }} {{ $receiver->name }}</h3>
        <div class="chat-box" id="chat-box" style="height: 400px; overflow-y: scroll; border: 1px solid #ddd; padding: 15px;">
            @foreach ($messages as $message)
                <div class="d-flex {{ $message->user_id == auth()->id() ? 'justify-content-end' : 'justify-content-start' }} mb-3"
                    {{ $message->user_id == auth()->id() ? 'style="max-width: 70vw;"' : '' }}>
                    @if ($message->user_id != auth()->id())
                        <!-- Gambar Profil -->
                        @if ($receiver->profile->visibility == 'unvisible')
                            <img src="{{ asset('storage/avatars/' . $receiver->profile->bear) }}" alt="{{ $receiver->name }}"
                                class="rounded-circle me-3 align-self-end"
                                style="width: 40px; height: 40px; object-fit: cover;">
                        @elseif ($receiver->avatars()->where('is_active', true)->first())
                            <img src="{{ asset('storage/avatars/' . $receiver->avatars()->where('is_active', true)->first()->profession->image) }}"
                                alt="{{ $receiver->name }}" class="rounded-circle me-3 align-self-end"
                                style="width: 40px; height: 40px; object-fit: cover;">
                        @else
                            <div class="bg-secondary text-white rounded-circle d-flex justify-content-center align-items-center me-3 align-self-end"
                                style="width: 40px; height: 40px; font-size: 24px;">
                                {{ strtoupper(substr($receiver->name, 0, 1)) }}
                            </div>
                        @endif
                    @endif
                    @if ($message->type == 'avatar')
                        <div class="" style="max-width: 60vw;">
                            <img src="{{ asset('storage/avatars/' . $message->image_url) }}" alt="Avatar" class="rounded"
                                style="width: 90px; height: 90px; object-fit: cover;">
                            @if ($message->user_id == auth()->id())
                                <p class="text-center mt-0 mb-0 text-success"><small>{{ $message->message }}</small></p>
                            @else
                                @if (!$message->hasOwnedAvatar)
                                    <p class="text-center mt-1">
                                        <a href="{{ route('save_sticker', ['id' => $message->avatar_id]) }}"
                                            class="btn btn-sm btn-warning col-12 btn-block">
                                            {{ __('Save') }}</a>
                                    </p>
                                @endif
                            @endif
                        </div>
                    @else
                        <!-- Bubble Pesan -->
                        <div class="bubble {{ $message->user_id == auth()->id() ? 'bg-primary text-white' : 'bg-light text-dark' }} p-2 rounded"
                            style="max-width: 60vw;">
                            {{ $message->message }}
                        </div>
                    @endif
                </div>
            @endforeach
        </div>

        <form id="message-form" class="mt-3">
            @csrf
            <input type="hidden" id="receiver_id" value="{{ $receiver->id }}">
            <div class="input-group">
                <input type="text" id="message" class="form-control" placeholder="{{ __('Type a message') }}">
                <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#professionModal">
                    <i class="fa fa-plus"></i>
                </button>
                <button type="submit" class="btn btn-primary">{{ __('Send') }}</button>
            </div>
        </form>
        <div class="modal fade" id="professionModal" tabindex="-1" aria-labelledby="professionModalLabel"
            aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="professionModalLabel">{{ __('Send Avatar') }}</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body" style="max-height: 60vh; overflow-y: auto;">
                        <div class="d-flex">
                            @foreach ($avatars as $avatar)
                                <div class="px-2 mb-3 text-center">
                                    <img src="{{ asset('storage/avatars/' . $avatar->image) }}" class="rounded mb-2"
                                        alt="{{ $avatar->name }}" style="width: 80px; height: 80px; object-fit: cover;">

                                    <form class="avatar-form">
                                        @csrf
                                        <input type="hidden" name="avatar_id" value="{{ $avatar->id }}">
                                        <input type="hidden" name="receiver_id" value="{{ $receiver->id }}">
                                        <button type="submit" class="btn btn-primary btn-sm btn-block">Send</button>
                                    </form>
                                </div>
                            @endforeach

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('script')
    <script>
        $(document).ready(function() {
            const chatBox = $('#chat-box');
            const receiverId = $('#receiver_id').val();

            // Auto scroll to the bottom
            chatBox.scrollTop(chatBox.prop('scrollHeight'));

            // Send message
            $('#message-form').on('submit', function(e) {
                e.preventDefault();
                const message = $('#message').val();

                if (message.trim() === '') return;

                $.ajax({
                    url: "{{ route('messages.send') }}",
                    type: "POST",
                    data: {
                        _token: "{{ csrf_token() }}",
                        receiver_id: receiverId,
                        message: message,
                    },
                    success: function(response) {
                        $('#message').val('');
                        chatBox.append(`
                        <div class="d-flex justify-content-end mb-3">
                            <div class="bubble bg-primary text-white p-2 rounded"  style="max-width: 60vw;">${response.message.message}</div>
                        </div>
                    `);
                        chatBox.scrollTop(chatBox.prop('scrollHeight'));
                    }
                });
            });



            // Fetch new messages
            setInterval(() => {
                const lastFetchTime = new Date().toISOString();
                $.ajax({
                    url: "{{ route('messages.fetch') }}",
                    type: "POST",
                    data: {
                        _token: "{{ csrf_token() }}",
                        sender_id: receiverId,
                        last_fetch_time: lastFetchTime,
                    },
                    success: function(messages) {
                        messages.forEach((msg) => {
                            let content = "";
                            
                            content += `
                                    @if ($receiver->profile->visibility == 'unvisible')
                                        <img src="{{ asset('storage/avatars/' . $receiver->profile->bear) }}" alt="{{ $receiver->name }}"
                                            class="rounded-circle me-3 align-self-end"
                                            style="width: 40px; height: 40px; object-fit: cover;">
                                    @elseif ($receiver->avatars()->where('is_active', true)->first())
                                        <img src="{{ asset('storage/avatars/' . $receiver->avatars()->where('is_active', true)->first()->profession->image) }}"
                                            alt="{{ $receiver->name }}" class="rounded-circle me-3 align-self-end"
                                            style="width: 40px; height: 40px; object-fit: cover;">
                                    @else
                                        <div class="bg-secondary text-white rounded-circle d-flex justify-content-center align-items-center me-3 align-self-end"
                                            style="width: 40px; height: 40px; font-size: 24px;">
                                            {{ strtoupper(substr($receiver->name, 0, 1)) }}
                                        </div>
                                    @endif
                                
                                `;
                            if (msg.type === "avatar") {
                                content += `
                <div class="" style="max-width: 60vw;">
                    <img src="/storage/avatars/${msg.image_url}" alt="Avatar" class="rounded"
                         style="width: 90px; height: 90px; object-fit: cover;">`;

                                if (msg.user_id === "{{ auth()->id() }}") {
                                    content +=
                                        `<p class="text-center mt-0 mb-0 text-success"><small>${msg.message}</small></p>`;
                                } else {
                                    if (!msg.hasOwnedAvatar) {
                                        content += `
                        <p class="text-center mt-1">
                            <a href="/save-sticker/${msg.avatar_id}" class="btn btn-sm btn-warning col-12 btn-block">
                                {{ __('Save') }}
                            </a>
                        </p>`;
                                    }
                                }
                                content += "</div>";
                            } else {
                                content += `
                <div class="bubble ${msg.user_id === "{{ auth()->id() }}" ? "bg-primary text-white" : "bg-light text-dark"} p-2 rounded"
                     style="max-width: 60vw;">
                    ${msg.message}
                </div>`;
                            }

                            const alignment = msg.user_id === "{{ auth()->id() }}" ?
                                "justify-content-end" : "justify-content-start";

                            chatBox.append(`
            <div class="d-flex ${alignment} mb-3">
                ${content}
            </div>
        `);
                        });

                        if (messages.length > 0) {
                            chatBox.scrollTop(chatBox.prop("scrollHeight"));
                        }
                    }

                });
            }, 3000); // Check every 3 seconds

            $(document).on('submit', '.avatar-form', function(e) {
                e.preventDefault();

                const form = $(this);
                const avatarId = form.find('input[name="avatar_id"]').val();
                const receiverId = form.find('input[name="receiver_id"]').val();

                $.ajax({
                    url: "{{ route('messages.send_avatar') }}",
                    type: "POST",
                    data: {
                        _token: "{{ csrf_token() }}",
                        message: avatarId, // Kirim ID avatar sebagai pesan
                        receiver_id: receiverId,
                    },
                    success: function(response) {
                        // Tutup modal atau form
                        $('#professionModal').modal('hide');

                        // Tambahkan avatar ke chat box
                        chatBox.append(`
                <div class="d-flex justify-content-end mb-3">
                    <div class="" style="max-width: 60vw;">
                    <img src="/storage/avatars/${response.message.image_url}" 
                         alt="Avatar" 
                         class="rounded" 
                         style="width: 90px; height: 90px; object-fit: cover;">
                         <p class="text-center mt-0 mb-0 text-success"><small>${response.message.message}</small></p>
                         </div>
                </div>
            `);

                        // Scroll chat box ke bawah
                        chatBox.scrollTop(chatBox.prop('scrollHeight'));
                    },
                    error: function(xhr) {
                        alert('Failed to send avatar: ' + xhr.responseJSON.message);
                    },
                });
            });

        });
    </script>
@endpush
