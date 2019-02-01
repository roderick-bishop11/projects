import responses

blackListedWords = ["lazy", "unmotivated","careless","terrible","stupid","nervous"]
#tbe words in this list would (with more development) cause the interview to end earlier and/or drop the user's score
idealWordsList = ["responsible", "communication", "communicator", "honest", "honesty", "leader", "leadership", "planner", "planning", "confident","creative","organized"]
#the words in this list would (with much more development) give points to the user based on how many they match

def returnSpeech(speech, endSession=True):
	return {
		"version": "1.0",
		"sessionAttributes": {},
		"response": {
		"outputSpeech": {
		"type": "PlainText",
		"text": speech
			},
			"shouldEndSession": endSession
		  }
	}

def on_intent(intent_request, session):
	# This means the person asked the skill to do an action

	intent_name = intent_request["intent"]["name"] #iterviw starts
	# This is the name of the intent (Defined in the Alexa Skill Kit)
	if intent_name == 'StartInterview':
		# whatDay intent
		return (responses.question_one(), False)
		# Return the response for what day
		# This also doesn't close the
	elif intent_name == 'InterviewQuestionTwo':
		return (responses.question_two(), False)
	elif intent_name == 'InterviewQuestionThree':
		return (responses.question_three(), False)
	elif intent_name == 'InterviewQuestionFour':
		return (responses.question_four(), False)
	elif intent_name == 'InterviewQuestionFive':
		return (responses.question_five(), False)
	elif intent_name == 'InterestQuestion':
		return (responses.special_question(), False)
	elif intent_name == 'general':
		return (responses.programming_language(), False)
	elif intent_name == 'CodingQuestion':
		return (responses.funnyish_response(), False)
	elif intent_name == 'Yes':
		return (responses.sweet_victory(), False)
	elif intent_name == 'Ending':
		return (responses.end_response(), False)
	elif intent_name =='giveScore':
		return (get_Score(), True)
		# Anything else - close
	else:
		return ("Thank you for checking out our skill.  Goodbye", True)
		# This one will close the session

#def count_sim_words(list1 [], list2 []):
	#count = 0
	#return count
# this def would count similar words to get metrics for our scoring
def get_score():
	score = random.randInt(70,100)
	if 70<=score<80:
		return ("Your grade is a C")
	elif 80<=score<90:
		return ("Your grade is a B")
	elif 90<=score<100:
		return ("Your grade is a A")
	else:
		return ("You did not do well on this interview. The likelihood of getting hired with your current interview skills is low. Please work on your interview skills and try again.")

#def calc_complex_score():
	#compScore = 0
	#this method would the complexity of the question to give the user a higher score for hitting the right metrics
	#return compScore

def lambda_handler(event, context):
	if event["request"]["type"] == "LaunchRequest":
		# This is when we open up the skill
		speech = responses.start_response()
		end_session = False
	elif event["request"]["type"] == "IntentRequest":
		# Whenever we go through a question
		speech, end_session = on_intent(event["request"], event["session"])
	else:
		speech = "This is exiting"
		end_session = True
	return returnSpeech(speech, end_session)

if __name__ == '__main__':
	pass
