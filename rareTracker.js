//// RARE TRACKER DISCORD BOT /////

//// INITIATE NODE.JS ////
const Discord = require('discord.js');
const Shell = require('node-powershell');
const auth = require('./auth.json');
const {Client, Attachment, MessageEmbed} = require('discord.js');
		

//// DISCORD BOT SECTION ///// 
const bot = new Discord.Client();
bot.login(auth.token);

bot.on('ready', () => {
  console.info(`Logged in as ${bot.user.tag}!`);
  console.info('By your command!');

function runIt() {
	
  	ps = new Shell({
		executionPolicy: 'Bypass',
		noProfile: true
	  });
	
	ps.addCommand('./rareTimers.ps1')
	ps.invoke()
		.then(results => {
			//console.log(results);
			let d = new Date();
			console.log(d.toLocaleString());
			let rareData = JSON.parse(results);

			let startsAt = `https://starts-at.com/e/?t=${rareData.startTime}&d=${rareData.startDate}&tz=New%20York`
			let bagStartsAt = `https://starts-at.com/e/?t=${rareData.bagStartTime}&d=${rareData.bagStartDate}&tz=New%20York`
			let mountStartsAt = `https://starts-at.com/e/?t=${rareData.mountStartTime}&d=${rareData.mountStartDate}&tz=New%20York`
			
			let cetstartsAt = `https://starts-at.com/e/?t=${rareData.cetstartTime}&d=${rareData.cetstartDate}&tz=France`
			let cetbagStartsAt = `https://starts-at.com/e/?t=${rareData.cetbagStartTime}&d=${rareData.cetbagStartDate}&tz=France`
			let cetmountStartsAt = `https://starts-at.com/e/?t=${rareData.cetmountStartTime}&d=${rareData.cetmountStartDate}&tz=France`
			
			let asiastartsAt = `https://starts-at.com/e/?t=${rareData.asiastartTime}&d=${rareData.asiastartDate}&tz=China`
			let asiabagStartsAt = `https://starts-at.com/e/?t=${rareData.asiabagStartTime}&d=${rareData.asiabagStartDate}&tz=China`
			let asiamountStartsAt = `https://starts-at.com/e/?t=${rareData.asiamountStartTime}&d=${rareData.asiamountStartDate}&tz=China`
			
			/////// NA - BROADCAST BOT TO #rare-tracker-na CHANNELS ////////////////
			const NAmasterEmbed = new Discord.MessageEmbed()
			.setColor('#8221E3') //#0099ff
			.setAuthor('North America - EST')
			.setTitle('Icecrown Rare Spawn Tracker')
			.setDescription('ðŸ» __Next Spawn__:')
			.setURL('https://www.wowhead.com/news=319033')
			.addFields(
				{ name: rareData.boss, value: rareData.way, inline: true},
				{ name: `Spawns in: ${rareData.diff} minutes`, value: `[${rareData.time}](${startsAt})`, inline: true},
				{ name: '\u200B', value: 'ðŸ‘œ __Next 34 Slot Bag__:'},
				{ name: 'Bronjahm', value: '/way 70.7 38.4', inline: true},
				{ name: `Spawns in: ${rareData.bagDiff}`, value: `[${rareData.bag}](${bagStartsAt})`, inline: true},
				{ name: '\u200B', value: 'ðŸ² __Next Proto-Drake Mount__:'},
				{ name: 'Skadi the Ruthless', value: '/way 57.8 56.1', inline: true},
				{ name: `Spawns in: ${rareData.mountDiff}`, value: `[${rareData.mount}](${mountStartsAt})`, inline: true},
			)
			.addField('\u200B', '[Discord Support](https://discord.gg/Qkqrgw357p) | [Buy me a coffee](https://www.buymeacoffee.com/echellon)')
			.setFooter(`Click a timestamp above to see your local time`)
			.setTimestamp()
			
			/////// EU - BROADCAST BOT TO #rare-tracker-eu CHANNELS ////////////////
			const EUmasterEmbed = new Discord.MessageEmbed()
			.setColor('#8221E3') //#0099ff
			.setAuthor('Europe - CET')
			.setTitle('Icecrown Rare Spawn Tracker')
			.setDescription('ðŸ» __Next Spawn__:')
			.setURL('https://www.wowhead.com/news=319033')
			.addFields(
				{ name: rareData.cetboss, value: rareData.cetway, inline: true},
				{ name: `Spawns in: ${rareData.cetdiff} minutes`, value: `[${rareData.cettime}](${cetstartsAt})`, inline: true},
				{ name: '\u200B', value: 'ðŸ‘œ __Next 34 Slot Bag__:'},
				{ name: 'Bronjahm', value: '/way 70.7 38.4', inline: true},
				{ name: `Spawns in: ${rareData.cetbagDiff}`, value: `[${rareData.cetbag}](${cetbagStartsAt})`, inline: true},
				{ name: '\u200B', value: 'ðŸ² __Next Proto-Drake Mount__:'},
				{ name: 'Skadi the Ruthless', value: '/way 57.8 56.1', inline: true},
				{ name: `Spawns in: ${rareData.cetmountDiff}`, value: `[${rareData.cetmount}](${cetmountStartsAt})`, inline: true},
			)
			.addField('\u200B', '[Discord Support](https://discord.gg/Qkqrgw357p) | [Buy me a coffee](https://www.buymeacoffee.com/echellon)')
			.setFooter(`Click a timestamp above to see your local time`)
			.setTimestamp()
			
			/////// ASIA - BROADCAST BOT TO #rare-tracker-asia CHANNELS ////////////////
			const ASIAmasterEmbed = new Discord.MessageEmbed()
			.setColor('#8221E3') //#0099ff
			.setAuthor('Asia - CST')
			.setTitle('Icecrown Rare Spawn Tracker')
			.setDescription('ðŸ» __Next Spawn__:')
			.setURL('https://www.wowhead.com/news=319033')
			.addFields(
				{ name: rareData.asiaboss, value: rareData.asiaway, inline: true},
				{ name: `Spawns in: ${rareData.asiadiff} minutes`, value: `[${rareData.asiatime}](${asiastartsAt})`, inline: true},
				{ name: '\u200B', value: 'ðŸ‘œ __Next 34 Slot Bag__:'},
				{ name: 'Bronjahm', value: '/way 70.7 38.4', inline: true},
				{ name: `Spawns in: ${rareData.asiabagDiff}`, value: `[${rareData.asiabag}](${asiabagStartsAt})`, inline: true},
				{ name: '\u200B', value: 'ðŸ² __Next Proto-Drake Mount__:'},
				{ name: 'Skadi the Ruthless', value: '/way 57.8 56.1', inline: true},
				{ name: `Spawns in: ${rareData.asiamountDiff}`, value: `[${rareData.asiamount}](${asiamountStartsAt})`, inline: true},
			)
			.addField('\u200B', '[Discord Support](https://discord.gg/Qkqrgw357p) | [Buy me a coffee](https://www.buymeacoffee.com/echellon)')
			.setFooter(`Click a timestamp above to see your local time`)
			.setTimestamp()
			
			/////// TEST TEST TEST - NA - BROADCAST BOT TO #rare-tracker-test CHANNELS ////////////////
			const TESTmasterEmbed = new Discord.MessageEmbed()
			.setColor('#8221E3') //#0099ff
			.setAuthor('North America - EST')
			.setTitle('Icecrown Rare Spawn Tracker')
			.setDescription('ðŸ» __Next Spawn__:')
			.setURL('https://www.wowhead.com/news=319033')
			.addFields(
				{ name: rareData.boss, value: rareData.way, inline: true},
				{ name: `Spawns in: ${rareData.diff} minutes`, value: `[${rareData.time}](${startsAt})`, inline: true},
				{ name: '\u200B', value: 'ðŸ‘œ __Next 34 Slot Bag__:'},
				{ name: 'Bronjahm', value: '/way 70.7 38.4', inline: true},
				{ name: `Spawns in: ${rareData.bagDiff}`, value: `[${rareData.bag}](${bagStartsAt})`, inline: true},
				{ name: '\u200B', value: 'ðŸ² __Next Proto-Drake Mount__:'},
				{ name: 'Skadi the Ruthless', value: '/way 57.8 56.1', inline: true},
				{ name: `Spawns in: ${rareData.mountDiff}`, value: `[${rareData.mount}](${mountStartsAt})`, inline: true},
			)
			.addField('\u200B', '[Discord Support](https://discord.gg/Qkqrgw357p) | [Buy me a coffee](https://www.buymeacoffee.com/echellon)')
			.setFooter(`Click a timestamp above to see your local time`)
			.setTimestamp()
			
      // loop through discord servers and send msg to matching channels
			bot.guilds.cache.forEach((guild) => {

				try {

					let sendtoNA = guild.channels.cache.find((x) => x.name == 'rare-tracker-na');
					let sendtoEU = guild.channels.cache.find((x) => x.name == 'rare-tracker-eu');
					let sendtoASIA = guild.channels.cache.find((x) => x.name == 'rare-tracker-asia');
					let sendtoTEST = guild.channels.cache.find((x) => x.name == 'rare-tracker-test');
					
					// send to NA channels
					if (!(sendtoNA === undefined)) {
						if (sendtoNA.permissionsFor(bot.user).has([84992])) {
							
							sendtoNA.messages.fetch({ limit: 10 }).then(messages => {
								const botMessages = messages.filter(msg => msg.author.id === bot.user.id);
								let lastMessage = botMessages.first();
								if (lastMessage) {
									lastMessage.edit(NAmasterEmbed);
									console.info("NA - Sent to " + guild.name);
								}
								else {
									sendtoNA.send(NAmasterEmbed);
									console.info("NA - Sent to " + guild.name);
								}
							})
							.catch(console.error);
						}
						else {
						console.log("NA - permissions denied for " + guild.name)
						return;
						}	
					}
					
					// send to EU channels
					if (!(sendtoEU === undefined)) {
						if (sendtoEU.permissionsFor(bot.user).has([84992])) {
							
							sendtoEU.messages.fetch({ limit: 10 }).then(messages => {
								const botMessages = messages.filter(msg => msg.author.id === bot.user.id);
								let lastMessage = botMessages.first();
								if (lastMessage) {
									lastMessage.edit(EUmasterEmbed);
									console.info("EU - Sent to " + guild.name);
								}
								else {
									sendtoEU.send(EUmasterEmbed);
									console.info("EU - Sent to " + guild.name);
								}
							})
							.catch(console.error);
						}
						else {
						console.log("EU - permissions denied for " + guild.name)
						return;
						}	
					}
					
					// send to ASIA channels
					if (!(sendtoASIA === undefined)) {
						if (sendtoASIA.permissionsFor(bot.user).has([84992])) {
							
							sendtoASIA.messages.fetch({ limit: 10 }).then(messages => {
								const botMessages = messages.filter(msg => msg.author.id === bot.user.id);
								let lastMessage = botMessages.first();
								if (lastMessage) {
									lastMessage.edit(ASIAmasterEmbed);
									console.info("ASIA - Sent to " + guild.name);
								}
								else {
									sendtoASIA.send(ASIAmasterEmbed);
									console.info("ASIA - Sent to " + guild.name);
								}
							})
							.catch(console.error);
						}
						else {
						console.log("ASIA - permissions denied for " + guild.name)
						return;
						}	
					}
					
					// send to TEST channels
					if (!(sendtoTEST === undefined)) {
						if (sendtoTEST.permissionsFor(bot.user).has([84992])) {
							
							sendtoTEST.messages.fetch({ limit: 10 }).then(messages => {
								const botMessages = messages.filter(msg => msg.author.id === bot.user.id);
								let lastMessage = botMessages.first();
								if (lastMessage) {
									lastMessage.edit(TESTmasterEmbed);
									console.info("TEST - Sent to " + guild.name);
								}
								else {
									sendtoTEST.send(TESTmasterEmbed);
									console.info("TEST - Sent to " + guild.name);
								}
							})
							.catch(console.error);
						}
						else {
						console.log("TEST - permissions denied for " + guild.name)
						return;
						}	
					}
					
				} 
				catch {
					//If message couldn't be sent
					console.error("no channel name for " + guild.name);
				}
			});
			
		ps.dispose();
		//bot.destroy();
		})
		// error
		.catch(err => {
			console.error(err)
			ps.dispose();
			//bot.destroy();
		});
}
// run it once a minute to update times and countdown
runIt();
setInterval(runIt, 60000);
});
