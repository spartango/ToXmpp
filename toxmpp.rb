#!/usr/bin/env ruby

require 'rubygems'
require 'xmpp4r/client'
require 'logger'

botUsername = ''
botPassword = ''

log = Logger.new(STDOUT)
log.level = Logger::DEBUG

targetUser = ARGV.shift 

if not botUsername 
    log.error "Sender username not provided."
    exit 1
elsif not botPassword
    log.error "Sender password not provided."
    exit 1
elsif not targetUser
    log.error "Recipient to not provided."
    exit 1
end

# Jabber::debug = true

# Login
client = Jabber::Client::new(Jabber::JID::new(botUsername))
client.connect 'talk.google.com', 5222
client.auth botPassword
client.send(Jabber::Presence.new.set_type(:available))

log.warn "[toXMPP]: Ready"

# Pull from input
while line = gets
    # Send message
    m = Jabber::Message::new(targetUser, line).set_type(:chat)
    client.send m
    # Fighting the gtalk throttle
    sleep(0.15)
end
client.close