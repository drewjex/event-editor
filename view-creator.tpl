<div class='row'>
    <div class='col-sm-12'>
        <a href='./'><< Home</a>
    </div>
</div>
<div class='row'>
    <div class='col-sm-12' style="text-align:center;">
        <!--<h4>Create New Item or Event</h4><br>-->
        <br><br>
        
        <div style="display:none;" id="1">
            <div class='slide_container transform move'>
                <div class="header">
                    Welcome to the <font color="#ccff33">Event Master 3000</font>.
                </div>
                <div class="content">
                    Prepare for awesomeness. With this event creator, you can create, edit, and view your events. It's easy, quick, and requires no outside assistance. No need to call John
                    and have the programmers do it anymore.<br><br>
                    <div class="form_element">
                        <div class="form_label" style="margin-top:10px;">
                            I want to...
                        </div>
                        <div class="form_response">
                            <select name = 'eventOptions' id='eventOptions'>
                                <option selected>--Select One--</option> 
                                <option value="create">Create a new event</option>
                                <option value="edit">Edit an event</option>
                            </select>
                        </div>
                    </div>
                    <br><br>
                <button type="button" class="btn btn-primary next" onclick="nextSlide()" >Continue >> </button>
                </div>
            </div>
        </div>

        <form 
            id = 'createEvent'
            onsubmit= 'return confirm("Publish event?")'
            action = './?view=admin_creator'
            method='POST'
            enctype='multipart/form-data'>
            <input type='hidden' name='dot' value='new-item'>
        
        <div style="display:none;" id="2">
            <div class='slide_container transform'>
                <div class="header alignLeft">
                    Let's start out with some basic information...
                    <div id="progress">1<font color="white">/4</font></div>
                </div>
                <div class="content">
                    <div class="form_element">
                        <div class="form_label">
                            What is the name of your event?
                        </div>
                        <div class="form_response">
                            <input type="text" placeholder="Event Name" name='name'> 
                        </div>
                    </div>
                    
                    <div class="form_element">
                        <div class="form_label">
                            What is the type of your event?
                        </div>
                        <div class="form_response">
                            <select name = 'itemTyper' id='itemType2'>
                                <option selected>--Select One--</option>
                                {foreach $types as $t}
                                    <option value="{$t.id}">{$t.slug}</option>
                                {/foreach}
                            </select>
                        </div>
                    </div>

                    {if isset($adminlogin.username) && $adminlogin.username == 'programmer'}
                        <div class="form_element">
                            <div class="form_label">
                                What is the Orginization for whom are making this event?
                            </div>
                            <div class="form_response">
                                <select name = 'organization_id'>
                                    <option selected>--Select One--</option>
                                    {foreach $organization as $o}
                                        <option value="{$o.id}">{$o.name}</option>
                                    {/foreach}
                                </select>
                            </div>
                        </div>
                    {/if}

                    <div class="form_element">
                        <div class="form_label">
                            What is the Cashnet Item-Code for your organization?
                        </div>
                        <div class="form_response">
                            <select name = 'financeId'>
                                <option selected>--Select One--</option>
                                {foreach $cashnetCodes as $c}
                                    <option value="{$c.id}">{$c.cashnet_item_code}</option>
                                {/foreach}
                            </select>
                        </div>
                    </div>
                    
                    <div class="form_element">
                        <div class="form_label">
                           Is this a single event or are there multiple events? <br><a class="fancybox" href="#inline1"><font size="1">What does this mean?</font></a>
                           <div id="inline1" style="max-width:550px;display: none;">
                                <h3>What do we mean by single or multiple events?</h3>
                                <p>
                                    <hr>
                                    A single event is an event that occurs once and it's done. For example, a concert typically happens on a particular day and only one time. <br><br>
                                    Multiple events, on the other hand, would be something like games for a sports team. BYU Soccer, for example, is the name of the event, but there are multiple events, or games, associated with
                                    BYU Soccer that occur throughout the season. Our Event Creator supports both kinds of events. 
                                </p>
                          </div>
                        </div>
                        <div class="form_response">
                            <input type="radio" class="option" name="eventType" id="single" value="single"> <label for="single">Single Event</label><br>
                            <input type="radio" class="option" name="eventType" id="multi" value="multi"> <label for="multiple">Multiple Events</label>
                        </div>
                    </div>
     
		  <br><br>
                <button type="button" class="btn btn-primary back" onclick="prevSlide()" > << Back</button>
                <button type="button" class="btn btn-primary next" onclick="nextSlide()" >Continue >> </button>
                </div>
            </div>
        </div>
        
        <div style="display:none;" id="3">
            <div class='slide_container transform'>
                <div class="header alignLeft">
                    Just a single event, eh? Let's set it up!
                    <div id="progress">2<font color="white">/4</font></div>
                </div>
                <div class="content">
                    <div class="form_element">
                        <div class="form_label">
                            How many total tickets will you be selling?
                        </div>
                        <div class="form_response">
                            <input type="number" name='ticketNumber'>
                        </div>
                    </div>
                    
                    <div class="form_element">
                        <div class="form_label">
                            How many different types of tickets will you be selling?
                        </div>
                        <div class="form_response">
                            <select name="numTickets" id="numTickets"  onchange="updateTicketTypes();">
                                <option> Number of Types of Tickets </option>
                                <option value = "1"> 1 </option>
                                <option value = "2"> 2 </option>
                                <option value = "3"> 3 </option>
                                <option value = "4"> 4 </option>
                                <option value = "5"> 5 </option>
                                <option value = "6"> 6 </option>
                                <option value = "7"> 7 </option>
                                <option value = "8"> 8 </option>            
                                <option value = "9"> 9 </option>
                            </select>   
                        </div>
                    </div>
                <br><br>
                
                <div class="changeHeight" id="number_of_tickets"></div>
                <div style="display:none;" id="typeofticket">
                    <input type='hidden' class='ticketId' />
                    <div class="form_element">
                        <div class="form_label">
                            What is the name for this ticket?
                        </div>
                        <div class="form_response">
                            <input type="text" class='ticketName'>
                        </div>
                    </div>
                    <div class="form_element">
                        <div class="form_label">
                            What is the type of ticket you want to sell?
                        </div>
                        <div class="form_response">
                            <select name = 'ticketType' class='ticketType'>
                                <option selected>--Select One--</option>
                                <option value="0">Promo</option>
                                {foreach $ticketTypes as $t}
                                    {if $t.name != 'Season Pass' && $t.name != 'Season Pass Individual Ticket'}
                                        <option value="{$t.id}">{$t.name}</option>
                                    {/if}
                                {/foreach}
                            </select>
                        </div>
                    </div>
                    <div class="form_element">
                        <div class="form_label">
                            What is the patron profile for this ticket?
                        </div>
                        <div class="form_response">
                            <select name = 'patronProfile' class='patronProfile'>
                                <option selected>--Select One--</option>
                                {foreach $patronProfiles as $p}
                                    <option value="{$p.id}">{$p.name}</option>
                                {/foreach}
                            </select>
                        </div>
                    </div>
                    <div class="form_element">
                        <div class="form_label">
                            What is the price for this ticket?
                        </div>
                        <div class="form_response">
                            <input type="number" min="0.00" step="0.01" max="2500" class='ticketPrice'>
                        </div>
                    </div>
                    <div class="form_element">
                        <div class="form_label">
                            How many tickets of this type do you want to sell? <small>(-1 = unlimited)</small>
                        </div>
                        <div class="form_response">
                            <input type="number" class='numTicketsOfType'>
                        </div>
                    </div>
                    <div class="form_element">
                        <div class="form_label">
                            Max number of tickets per person <small>(-1 = unlimited)</small> :
                        </div>
                        <div class="form_response">
                            <input type="number" class='numTicketsPerPerson'>
                        </div>
                    </div>
                </div>
                    
                <button type="button" class="btn btn-primary back" onclick="prevSlide()" > << Back</button>
                <button type="button" class="btn btn-primary next" onclick="nextSlide()" >Continue >> </button>
                </div>
            </div>
        </div>
        
        <div style="display:none;" id="4">
            <div class='slide_container transform'> 
                <div class="header alignLeft">
                    Several events? Let's get 'er done!
                    <div id="progress">2<font color="white">/4</font></div> 
                </div>
                <div class="content">
                    <div class="form_element">
                        <div class="form_label">
                            Will there be season passes available for this multi-event?
                        </div>
                        <div class="form_response">
                            <input type="radio" class="season" name="season-tix" id="season" value="season" onchange="updateChildNames();"> <label for="season">Season Passes</label><br>
                            <input type="radio" class="no-season" name="season-tix" id="no-season" value="no-season" onchange="updateChildNames();"> <label for="no-season">No Season Passes</label>
                        </div>
                    </div>
                    <div class="form_element">
                        <div class="form_label">
                            Number of Child Events:
                        </div>
                        <div class="form_response">
                            <input type="number" min='1' id='num_child_events' name='num_child_events' onchange="updateChildNames();">
                        </div>
                    </div>
                <br><br>
                <button type="button" class="btn btn-primary back" onclick="prevSlide()" > << Back</button>
                <button type="button" class="btn btn-primary next" onclick="nextSlide(15)" >Continue >> </button>
                </div>
            </div>
        </div>

        <div style="display:none;" id="15">
            <div class='slide_container transform'> 
                <div class="header alignLeft">
                    Let's set up each of your events!
                    <div id="progress">3<font color="white">/4</font></div> 
                </div>
                <div class="content" style='width:100%; padding-top:20px;'>
                    <div id="number_of_children"></div>
                    <div style="display:none;" id='childEventsElement'>
                        <div class="form_element">
                            <div class="form_label">
                                Name of Event:
                            </div>
                            <div class="form_response">
                                <input type="text" placeholder="Event Name" class='child_name'>
                            </div>
                        </div>
                        <div class="form_element">
                            <div class="form_label">
                                How many total tickets will you be selling for this event?
                            </div>
                            <div class="form_response">
                                <input type="number" class="child_ticket_number">
                            </div>
                        </div>
                        
                        <div class="form_element">
                            <div class="form_label">
                                How many different types of tickets will you be selling?
                            </div>
                            <div class="form_response">
                                <select class="child_num_ticket_types">
                                    <option> Number of Types of Tickets </option>
                                    <option value = "1"> 1 </option>
                                    <option value = "2"> 2 </option>
                                    <option value = "3"> 3 </option>
                                    <option value = "4"> 4 </option>
                                    <option value = "5"> 5 </option>
                                    <option value = "6"> 6 </option>
                                    <option value = "7"> 7 </option>
                                    <option value = "8"> 8 </option>            
                                    <option value = "9"> 9 </option>
                                </select>   
                            </div>
                        </div>
                        <br><br>

                        <div class="changeHeight"></div>
                        <div style="display:none;" class="typeofticket">
                            <div class="form_element">
                                <div class="form_label">
                                    What is the name for this ticket?
                                </div>
                                <div class="form_response">
                                    <input type="text" class='ticketName'>
                                </div>
                            </div>
                            <div class="form_element">
                                <div class="form_label">
                                    What is the type of ticket you want to sell?
                                </div>
                                <div class="form_response">
                                    <select name = 'ticketType' class='ticketType'>
                                        <option selected>--Select One--</option>
                                        <option value="0">Promo</option>
                                        {foreach $ticketTypes as $t}
                                            <option value="{$t.id}">{$t.name}</option>
                                        {/foreach}
                                    </select>
                                </div>
                            </div>
                            <div class="form_element">
                                <div class="form_label">
                                    What is the patron profile for this ticket?
                                </div>
                                <div class="form_response">
                                    <select name = 'patronProfile' class='patronProfile'>
                                        <option selected>--Select One--</option>
                                        {foreach $patronProfiles as $p}
                                            <option value="{$p.id}">{$p.name}</option>
                                        {/foreach}
                                    </select>
                                </div>
                            </div>
                            <div class="form_element">
                                <div class="form_label">
                                    What is the price for this ticket?
                                </div>
                                <div class="form_response">
                                    <input type="number" min="0.00" step="0.01" max="2500" class='ticketPrice'>
                                </div>
                            </div>
                            <div class="form_element">
                                <div class="form_label">
                                    How many tickets of this type do you want to sell?:
                                </div>
                                <div class="form_response">
                                    <input type="number" class='numTicketsOfType'>
                                </div>
                            </div>
                            <div class="form_element">
                                <div class="form_label">
                                    Max number of tickets per person:
                                </div>
                                <div class="form_response">
                                    <input type="number" class='numTicketsPerPerson'>
                                </div>
                            </div>
                        </div>

                        <div class="form_element">
                            <div class="form_label">
                                When does your event start?
                            </div>
                            <div class="form_response">
                                <select class="startDateMonth">
                                    <option> Month </option>
                                    <option value = "01"> January </option>
                                    <option value = "02"> February </option>
                                    <option value = "03"> March </option>
                                    <option value = "04"> April </option>
                                    <option value = "05"> May </option>
                                    <option value = "06"> June </option>
                                    <option value = "07"> July </option>
                                    <option value = "08"> August </option>            
                                    <option value = "09"> September </option>
                                    <option value = "10"> October </option>
                                    <option value = "11"> November </option>
                                    <option value = "12"> December </option>
                                </select>
                                <select class="startDateDay">
                                    <option> Day </option>
                                    <option value="01">1</option>
                                    <option value="02">2</option>
                                    <option value="03">3</option>
                                    <option value="04">4</option>
                                    <option value="05">5</option>
                                    <option value="06">6</option>
                                    <option value="07">7</option>
                                    <option value="08">8</option>
                                    <option value="09">9</option>
                                    <option value="10">10</option>
                                    <option value="11">11</option>
                                    <option value="12">12</option>
                                    <option value="13">13</option>
                                    <option value="14">14</option>
                                    <option value="15">15</option>
                                    <option value="16">16</option>
                                    <option value="17">17</option>
                                    <option value="18">18</option>
                                    <option value="19">19</option>
                                    <option value="20">20</option>
                                    <option value="21">21</option>
                                    <option value="22">22</option>
                                    <option value="23">23</option>
                                    <option value="24">24</option>
                                    <option value="25">25</option>
                                    <option value="26">26</option>
                                    <option value="27">27</option>
                                    <option value="28">28</option>
                                    <option value="29">29</option>
                                    <option value="30">30</option>
                                    <option value="31">31</option>
                                </select>
                                <select class="startDateYear">
                                    <option> Year </option>
                                    <option value="2015">2015</option>
                                    <option value="2016">2016</option>
                                    <option value="2017">2017</option>
                                    <option value="2018">2018</option>
                                    <option value="2019">2019</option>
                                    <option value="2020">2020</option>
                                    <option value="2021">2021</option>
                                    <option value="2022">2022</option>
                                    <option value="2023">2023</option>
                                    <option value="2024">2024</option>
                                    <option value="2025">2025</option>
                                </select>
                                <select class="startEventTime">
                                    <option> Time </option>
                                    <option value="00:00:00">12:00am</option>
                                    <option value="00:30:00">12:30am</option>
                                    <option value="1:00:00">1:00am</option>
                                    <option value="1:30:00">1:30am</option>
                                    <option value="2:00:00">2:00am</option>
                                    <option value="2:30:00">2:30am</option>
                                    <option value="3:00:00">3:00am</option>
                                    <option value="3:30:00">3:30am</option>
                                    <option value="4:00:00">4:00am</option>
                                    <option value="4:30:00">4:30am</option>
                                    <option value="5:00:00">5:00am</option>
                                    <option value="5:30:00">5:30am</option>
                                    <option value="6:00:00">6:00am</option>
                                    <option value="6:30:00">6:30am</option>
                                    <option value="7:00:00">7:00am</option>
                                    <option value="7:30:00">7:30am</option>
                                    <option value="8:00:00">8:00am</option>
                                    <option value="8:30:00">8:30am</option>
                                    <option value="9:00:00">9:00am</option>
                                    <option value="9:30:00">9:30am</option>
                                    <option value="10:00:00">10:00am</option>
                                    <option value="10:30:00">10:30am</option>
                                    <option value="11:00:00">11:00am</option>
                                    <option value="11:30:00">11:30am</option>
                                    <option value="12:00:00">12:00pm</option>
                                    <option value="12:30:00">12:30pm</option>
                                    <option value="13:00:00">1:00pm</option>
                                    <option value="13:30:00">1:30pm</option>
                                    <option value="14:00:00">2:00pm</option>
                                    <option value="14:30:00">2:30pm</option>
                                    <option value="15:00:00">3:00pm</option>
                                    <option value="15:30:00">3:30pm</option>
                                    <option value="16:00:00">4:00pm</option>
                                    <option value="16:30:00">4:30pm</option>
                                    <option value="17:00:00">5:00pm</option>
                                    <option value="17:30:00">5:30pm</option>
                                    <option value="18:00:00">6:00pm</option>
                                    <option value="18:30:00">6:30pm</option>
                                    <option value="19:00:00">7:00pm</option>
                                    <option value="19:30:00">7:30pm</option>
                                    <option value="20:00:00">8:00pm</option>
                                    <option value="20:30:00">8:30pm</option>
                                    <option value="21:00:00">9:00pm</option>
                                    <option value="21:30:00">9:30pm</option>
                                    <option value="22:00:00">10:00pm</option>
                                    <option value="22:30:00">10:30pm</option>
                                    <option value="23:00:00">11:00pm</option>
                                    <option value="23:30:00">11:30pm</option>
                                </select>
                            </div>
                        </div>
                        
                        <div class="form_element">
                            <div class="form_label">
                                When does your event end?
                            </div>
                            <div class="form_response">
                                <select class="endDateMonth">
                                    <option> Month </option>
                                    <option value = "01"> January </option>
                                    <option value = "02"> February </option>
                                    <option value = "03"> March </option>
                                    <option value = "04"> April </option>
                                    <option value = "05"> May </option>
                                    <option value = "06"> June </option>
                                    <option value = "07"> July </option>
                                    <option value = "08"> August </option>            
                                    <option value = "09"> September </option>
                                    <option value = "10"> October </option>
                                    <option value = "11"> November </option>
                                    <option value = "12"> December </option>
                                </select>
                                <select class="endDateDay">
                                    <option> Day </option>
                                    <option value="01">1</option>
                                    <option value="02">2</option>
                                    <option value="03">3</option>
                                    <option value="04">4</option>
                                    <option value="05">5</option>
                                    <option value="06">6</option>
                                    <option value="07">7</option>
                                    <option value="08">8</option>
                                    <option value="09">9</option>
                                    <option value="10">10</option>
                                    <option value="11">11</option>
                                    <option value="12">12</option>
                                    <option value="13">13</option>
                                    <option value="14">14</option>
                                    <option value="15">15</option>
                                    <option value="16">16</option>
                                    <option value="17">17</option>
                                    <option value="18">18</option>
                                    <option value="19">19</option>
                                    <option value="20">20</option>
                                    <option value="21">21</option>
                                    <option value="22">22</option>
                                    <option value="23">23</option>
                                    <option value="24">24</option>
                                    <option value="25">25</option>
                                    <option value="26">26</option>
                                    <option value="27">27</option>
                                    <option value="28">28</option>
                                    <option value="29">29</option>
                                    <option value="30">30</option>
                                    <option value="31">31</option>
                                </select>
                                <select class="endDateYear">
                                    <option> Year </option>
                                    <option value="2015">2015</option>
                                    <option value="2016">2016</option>
                                    <option value="2017">2017</option>
                                    <option value="2018">2018</option>
                                    <option value="2019">2019</option>
                                    <option value="2020">2020</option>
                                    <option value="2021">2021</option>
                                    <option value="2022">2022</option>
                                    <option value="2023">2023</option>
                                    <option value="2024">2024</option>
                                    <option value="2025">2025</option>
                                </select>
                                <select class="endEventTime">
                                    <option> Time </option>
                                    <option value="00:00:00">12:00am</option>
                                    <option value="00:30:00">12:30am</option>
                                    <option value="1:00:00">1:00am</option>
                                    <option value="1:30:00">1:30am</option>
                                    <option value="2:00:00">2:00am</option>
                                    <option value="2:30:00">2:30am</option>
                                    <option value="3:00:00">3:00am</option>
                                    <option value="3:30:00">3:30am</option>
                                    <option value="4:00:00">4:00am</option>
                                    <option value="4:30:00">4:30am</option>
                                    <option value="5:00:00">5:00am</option>
                                    <option value="5:30:00">5:30am</option>
                                    <option value="6:00:00">6:00am</option>
                                    <option value="6:30:00">6:30am</option>
                                    <option value="7:00:00">7:00am</option>
                                    <option value="7:30:00">7:30am</option>
                                    <option value="8:00:00">8:00am</option>
                                    <option value="8:30:00">8:30am</option>
                                    <option value="9:00:00">9:00am</option>
                                    <option value="9:30:00">9:30am</option>
                                    <option value="10:00:00">10:00am</option>
                                    <option value="10:30:00">10:30am</option>
                                    <option value="11:00:00">11:00am</option>
                                    <option value="11:30:00">11:30am</option>
                                    <option value="12:00:00">12:00pm</option>
                                    <option value="12:30:00">12:30pm</option>
                                    <option value="13:00:00">1:00pm</option>
                                    <option value="13:30:00">1:30pm</option>
                                    <option value="14:00:00">2:00pm</option>
                                    <option value="14:30:00">2:30pm</option>
                                    <option value="15:00:00">3:00pm</option>
                                    <option value="15:30:00">3:30pm</option>
                                    <option value="16:00:00">4:00pm</option>
                                    <option value="16:30:00">4:30pm</option>
                                    <option value="17:00:00">5:00pm</option>
                                    <option value="17:30:00">5:30pm</option>
                                    <option value="18:00:00">6:00pm</option>
                                    <option value="18:30:00">6:30pm</option>
                                    <option value="19:00:00">7:00pm</option>
                                    <option value="19:30:00">7:30pm</option>
                                    <option value="20:00:00">8:00pm</option>
                                    <option value="20:30:00">8:30pm</option>
                                    <option value="21:00:00">9:00pm</option>
                                    <option value="21:30:00">9:30pm</option>
                                    <option value="22:00:00">10:00pm</option>
                                    <option value="22:30:00">10:30pm</option>
                                    <option value="23:00:00">11:00pm</option>
                                    <option value="23:30:00">11:30pm</option>
                                </select>
                            </div>
                        </div>
                        
                        <div class="form_element">
                            <div class="form_label">
                                When do you want tickets to go on sale for your event?
                            </div>
                            <div class="form_response">
                                <select class="saleDateMonth">
                                    <option> Month </option>
                                    <option value = "01"> January </option>
                                    <option value = "02"> February </option>
                                    <option value = "03"> March </option>
                                    <option value = "04"> April </option>
                                    <option value = "05"> May </option>
                                    <option value = "06"> June </option>
                                    <option value = "07"> July </option>
                                    <option value = "08"> August </option>            
                                    <option value = "09"> September </option>
                                    <option value = "10"> October </option>
                                    <option value = "11"> November </option>
                                    <option value = "12"> December </option>
                                </select>
                                <select class="saleDateDay">
                                    <option> Day </option>
                                    <option value="01">1</option>
                                    <option value="02">2</option>
                                    <option value="03">3</option>
                                    <option value="04">4</option>
                                    <option value="05">5</option>
                                    <option value="06">6</option>
                                    <option value="07">7</option>
                                    <option value="08">8</option>
                                    <option value="09">9</option>
                                    <option value="10">10</option>
                                    <option value="11">11</option>
                                    <option value="12">12</option>
                                    <option value="13">13</option>
                                    <option value="14">14</option>
                                    <option value="15">15</option>
                                    <option value="16">16</option>
                                    <option value="17">17</option>
                                    <option value="18">18</option>
                                    <option value="19">19</option>
                                    <option value="20">20</option>
                                    <option value="21">21</option>
                                    <option value="22">22</option>
                                    <option value="23">23</option>
                                    <option value="24">24</option>
                                    <option value="25">25</option>
                                    <option value="26">26</option>
                                    <option value="27">27</option>
                                    <option value="28">28</option>
                                    <option value="29">29</option>
                                    <option value="30">30</option>
                                    <option value="31">31</option>
                                </select>
                                <select class="saleDateYear">
                                    <option> Year </option>
                                    <option value="2015">2015</option>
                                    <option value="2016">2016</option>
                                    <option value="2017">2017</option>
                                    <option value="2018">2018</option>
                                    <option value="2019">2019</option>
                                    <option value="2020">2020</option>
                                    <option value="2021">2021</option>
                                    <option value="2022">2022</option>
                                    <option value="2023">2023</option>
                                    <option value="2024">2024</option>
                                    <option value="2025">2025</option>
                                </select>
                                <select class="saleEventTime">
                                    <option> Time </option>
                                    <option value="00:00:00">12:00am</option>
                                    <option value="00:30:00">12:30am</option>
                                    <option value="1:00:00">1:00am</option>
                                    <option value="1:30:00">1:30am</option>
                                    <option value="2:00:00">2:00am</option>
                                    <option value="2:30:00">2:30am</option>
                                    <option value="3:00:00">3:00am</option>
                                    <option value="3:30:00">3:30am</option>
                                    <option value="4:00:00">4:00am</option>
                                    <option value="4:30:00">4:30am</option>
                                    <option value="5:00:00">5:00am</option>
                                    <option value="5:30:00">5:30am</option>
                                    <option value="6:00:00">6:00am</option>
                                    <option value="6:30:00">6:30am</option>
                                    <option value="7:00:00">7:00am</option>
                                    <option value="7:30:00">7:30am</option>
                                    <option value="8:00:00">8:00am</option>
                                    <option value="8:30:00">8:30am</option>
                                    <option value="9:00:00">9:00am</option>
                                    <option value="9:30:00">9:30am</option>
                                    <option value="10:00:00">10:00am</option>
                                    <option value="10:30:00">10:30am</option>
                                    <option value="11:00:00">11:00am</option>
                                    <option value="11:30:00">11:30am</option>
                                    <option value="12:00:00">12:00pm</option>
                                    <option value="12:30:00">12:30pm</option>
                                    <option value="13:00:00">1:00pm</option>
                                    <option value="13:30:00">1:30pm</option>
                                    <option value="14:00:00">2:00pm</option>
                                    <option value="14:30:00">2:30pm</option>
                                    <option value="15:00:00">3:00pm</option>
                                    <option value="15:30:00">3:30pm</option>
                                    <option value="16:00:00">4:00pm</option>
                                    <option value="16:30:00">4:30pm</option>
                                    <option value="17:00:00">5:00pm</option>
                                    <option value="17:30:00">5:30pm</option>
                                    <option value="18:00:00">6:00pm</option>
                                    <option value="18:30:00">6:30pm</option>
                                    <option value="19:00:00">7:00pm</option>
                                    <option value="19:30:00">7:30pm</option>
                                    <option value="20:00:00">8:00pm</option>
                                    <option value="20:30:00">8:30pm</option>
                                    <option value="21:00:00">9:00pm</option>
                                    <option value="21:30:00">9:30pm</option>
                                    <option value="22:00:00">10:00pm</option>
                                    <option value="22:30:00">10:30pm</option>
                                    <option value="23:00:00">11:00pm</option>
                                    <option value="23:30:00">11:30pm</option>
                                </select>
                            </div>
                        </div>
                        
                        <div class="form_element">
                            <div class="form_label">
                                Where is your event being held?
                            </div>
                            <div class="form_response">
                                <select class='venueV'>
                                    <option class="selectSecond" selected>--Select One--</option>
                                    {foreach $venues as $v}
                                        <option value="{$v.id}">{$v.name}</option>
                                    {/foreach}
                                    <option value="New">NEW</option>
                                </select>
                            </div>
                        </div>                        

                    </div>
                <br><br>
                <button type="button" class="btn btn-primary back" onclick="prevSlide(4)" > << Back</button>
                <button type="button" class="btn btn-primary next" onclick="nextSlide(16)" >Continue >> </button>
                </div>
            </div>
        </div>
        
        <div style="display:none;" id="5">
            <div class='slide_container transform'> 
                <div class="header alignLeft">
                    Some important scheduling information...
                    <div id="progress">3<font color="white">/4</font></div>
                </div>
                <div class="content">
                    <div class="form_element">
                        <div class="form_label">
                            When does your event start?
                        </div>
                        <div class="form_response">
                            <select name="startDateMonth" id="startDateMonth" onchange='document.getElementById("endDateMonth").value = this.value;'>
                                <option> Month </option>
                                <option value = "01"> January </option>
                                <option value = "02"> February </option>
                                <option value = "03"> March </option>
                                <option value = "04"> April </option>
                                <option value = "05"> May </option>
                                <option value = "06"> June </option>
                                <option value = "07"> July </option>
                                <option value = "08"> August </option>            
                                <option value = "09"> September </option>
                                <option value = "10"> October </option>
                                <option value = "11"> November </option>
                                <option value = "12"> December </option>
                            </select>
                            <select name="startDateDay" id="startDateDay" onchange='document.getElementById("endDateDay").value = this.value;'>
                                <option> Day </option>
                                <option value="01">1</option>
                                <option value="02">2</option>
                                <option value="03">3</option>
                                <option value="04">4</option>
                                <option value="05">5</option>
                                <option value="06">6</option>
                                <option value="07">7</option>
                                <option value="08">8</option>
                                <option value="09">9</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                                <option value="13">13</option>
                                <option value="14">14</option>
                                <option value="15">15</option>
                                <option value="16">16</option>
                                <option value="17">17</option>
                                <option value="18">18</option>
                                <option value="19">19</option>
                                <option value="20">20</option>
                                <option value="21">21</option>
                                <option value="22">22</option>
                                <option value="23">23</option>
                                <option value="24">24</option>
                                <option value="25">25</option>
                                <option value="26">26</option>
                                <option value="27">27</option>
                                <option value="28">28</option>
                                <option value="29">29</option>
                                <option value="30">30</option>
                                <option value="31">31</option>
                            </select>
                            <select name="startDateYear" id="startDateYear" onchange='document.getElementById("endDateYear").value = this.value;'>
                                <option> Year </option>
                                <option value="2015">2015</option>
                                <option value="2016">2016</option>
                                <option value="2017">2017</option>
                                <option value="2018">2018</option>
                                <option value="2019">2019</option>
                                <option value="2020">2020</option>
                                <option value="2021">2021</option>
                                <option value="2022">2022</option>
                                <option value="2023">2023</option>
                                <option value="2024">2024</option>
                                <option value="2025">2025</option>
                            </select>
                            <select name="startEventTime" id="startEventTime" onchange='document.getElementById("endEventTime").value = this.value;'>
                                <option> Time </option>
                                <option value="00:00:00">12:00am</option>
                                <option value="00:30:00">12:30am</option>
                                <option value="1:00:00">1:00am</option>
                                <option value="1:30:00">1:30am</option>
                                <option value="2:00:00">2:00am</option>
                                <option value="2:30:00">2:30am</option>
                                <option value="3:00:00">3:00am</option>
                                <option value="3:30:00">3:30am</option>
                                <option value="4:00:00">4:00am</option>
                                <option value="4:30:00">4:30am</option>
                                <option value="5:00:00">5:00am</option>
                                <option value="5:30:00">5:30am</option>
                                <option value="6:00:00">6:00am</option>
                                <option value="6:30:00">6:30am</option>
                                <option value="7:00:00">7:00am</option>
                                <option value="7:30:00">7:30am</option>
                                <option value="8:00:00">8:00am</option>
                                <option value="8:30:00">8:30am</option>
                                <option value="9:00:00">9:00am</option>
                                <option value="9:30:00">9:30am</option>
                                <option value="10:00:00">10:00am</option>
                                <option value="10:30:00">10:30am</option>
                                <option value="11:00:00">11:00am</option>
                                <option value="11:30:00">11:30am</option>
                                <option value="12:00:00">12:00pm</option>
                                <option value="12:30:00">12:30pm</option>
                                <option value="13:00:00">1:00pm</option>
                                <option value="13:30:00">1:30pm</option>
                                <option value="14:00:00">2:00pm</option>
                                <option value="14:30:00">2:30pm</option>
                                <option value="15:00:00">3:00pm</option>
                                <option value="15:30:00">3:30pm</option>
                                <option value="16:00:00">4:00pm</option>
                                <option value="16:30:00">4:30pm</option>
                                <option value="17:00:00">5:00pm</option>
                                <option value="17:30:00">5:30pm</option>
                                <option value="18:00:00">6:00pm</option>
                                <option value="18:30:00">6:30pm</option>
                                <option value="19:00:00">7:00pm</option>
                                <option value="19:30:00">7:30pm</option>
                                <option value="20:00:00">8:00pm</option>
                                <option value="20:30:00">8:30pm</option>
                                <option value="21:00:00">9:00pm</option>
                                <option value="21:30:00">9:30pm</option>
                                <option value="22:00:00">10:00pm</option>
                                <option value="22:30:00">10:30pm</option>
                                <option value="23:00:00">11:00pm</option>
                                <option value="23:30:00">11:30pm</option>
                             </select>
                        </div>
                    </div>
                    
                    <div class="form_element">
                        <div class="form_label">
                            When does your event end?
                        </div>
                        <div class="form_response">
                            <select name="endDateMonth" id="endDateMonth">
                                <option> Month </option>
                                <option value = "01"> January </option>
                                <option value = "02"> February </option>
                                <option value = "03"> March </option>
                                <option value = "04"> April </option>
                                <option value = "05"> May </option>
                                <option value = "06"> June </option>
                                <option value = "07"> July </option>
                                <option value = "08"> August </option>            
                                <option value = "09"> September </option>
                                <option value = "10"> October </option>
                                <option value = "11"> November </option>
                                <option value = "12"> December </option>
                            </select>
                            <select name="endDateDay" id="endDateDay">
                                <option> Day </option>
                                <option value="01">1</option>
                                <option value="02">2</option>
                                <option value="03">3</option>
                                <option value="04">4</option>
                                <option value="05">5</option>
                                <option value="06">6</option>
                                <option value="07">7</option>
                                <option value="08">8</option>
                                <option value="09">9</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                                <option value="13">13</option>
                                <option value="14">14</option>
                                <option value="15">15</option>
                                <option value="16">16</option>
                                <option value="17">17</option>
                                <option value="18">18</option>
                                <option value="19">19</option>
                                <option value="20">20</option>
                                <option value="21">21</option>
                                <option value="22">22</option>
                                <option value="23">23</option>
                                <option value="24">24</option>
                                <option value="25">25</option>
                                <option value="26">26</option>
                                <option value="27">27</option>
                                <option value="28">28</option>
                                <option value="29">29</option>
                                <option value="30">30</option>
                                <option value="31">31</option>
                            </select>
                            <select name="endDateYear" id="endDateYear">
                                <option> Year </option>
                                <option value="2015">2015</option>
                                <option value="2016">2016</option>
                                <option value="2017">2017</option>
                                <option value="2018">2018</option>
                                <option value="2019">2019</option>
                                <option value="2020">2020</option>
                                <option value="2021">2021</option>
                                <option value="2022">2022</option>
                                <option value="2023">2023</option>
                                <option value="2024">2024</option>
                                <option value="2025">2025</option>
                            </select>
                            <select name="endEventTime" id="endEventTime">
                                <option> Time </option>
                                <option value="00:00:00">12:00am</option>
                                <option value="00:30:00">12:30am</option>
                                <option value="1:00:00">1:00am</option>
                                <option value="1:30:00">1:30am</option>
                                <option value="2:00:00">2:00am</option>
                                <option value="2:30:00">2:30am</option>
                                <option value="3:00:00">3:00am</option>
                                <option value="3:30:00">3:30am</option>
                                <option value="4:00:00">4:00am</option>
                                <option value="4:30:00">4:30am</option>
                                <option value="5:00:00">5:00am</option>
                                <option value="5:30:00">5:30am</option>
                                <option value="6:00:00">6:00am</option>
                                <option value="6:30:00">6:30am</option>
                                <option value="7:00:00">7:00am</option>
                                <option value="7:30:00">7:30am</option>
                                <option value="8:00:00">8:00am</option>
                                <option value="8:30:00">8:30am</option>
                                <option value="9:00:00">9:00am</option>
                                <option value="9:30:00">9:30am</option>
                                <option value="10:00:00">10:00am</option>
                                <option value="10:30:00">10:30am</option>
                                <option value="11:00:00">11:00am</option>
                                <option value="11:30:00">11:30am</option>
                                <option value="12:00:00">12:00pm</option>
                                <option value="12:30:00">12:30pm</option>
                                <option value="13:00:00">1:00pm</option>
                                <option value="13:30:00">1:30pm</option>
                                <option value="14:00:00">2:00pm</option>
                                <option value="14:30:00">2:30pm</option>
                                <option value="15:00:00">3:00pm</option>
                                <option value="15:30:00">3:30pm</option>
                                <option value="16:00:00">4:00pm</option>
                                <option value="16:30:00">4:30pm</option>
                                <option value="17:00:00">5:00pm</option>
                                <option value="17:30:00">5:30pm</option>
                                <option value="18:00:00">6:00pm</option>
                                <option value="18:30:00">6:30pm</option>
                                <option value="19:00:00">7:00pm</option>
                                <option value="19:30:00">7:30pm</option>
                                <option value="20:00:00">8:00pm</option>
                                <option value="20:30:00">8:30pm</option>
                                <option value="21:00:00">9:00pm</option>
                                <option value="21:30:00">9:30pm</option>
                                <option value="22:00:00">10:00pm</option>
                                <option value="22:30:00">10:30pm</option>
                                <option value="23:00:00">11:00pm</option>
                                <option value="23:30:00">11:30pm</option>
                             </select>
                        </div>
                    </div>
                    
                    <div class="form_element">
                        <div class="form_label">
                            When do you want tickets to go on sale for your event?
                        </div>
                        <div class="form_response">
                            <select name="saleDateMonth" id="saleDateMonth">
                                <option> Month </option>
                                <option value = "01"> January </option>
                                <option value = "02"> February </option>
                                <option value = "03"> March </option>
                                <option value = "04"> April </option>
                                <option value = "05"> May </option>
                                <option value = "06"> June </option>
                                <option value = "07"> July </option>
                                <option value = "08"> August </option>            
                                <option value = "09"> September </option>
                                <option value = "10"> October </option>
                                <option value = "11"> November </option>
                                <option value = "12"> December </option>
                            </select>
                            <select name="saleDateDay" id="saleDateDay">
                                <option> Day </option>
                                <option value="01">1</option>
                                <option value="02">2</option>
                                <option value="03">3</option>
                                <option value="04">4</option>
                                <option value="05">5</option>
                                <option value="06">6</option>
                                <option value="07">7</option>
                                <option value="08">8</option>
                                <option value="09">9</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                                <option value="13">13</option>
                                <option value="14">14</option>
                                <option value="15">15</option>
                                <option value="16">16</option>
                                <option value="17">17</option>
                                <option value="18">18</option>
                                <option value="19">19</option>
                                <option value="20">20</option>
                                <option value="21">21</option>
                                <option value="22">22</option>
                                <option value="23">23</option>
                                <option value="24">24</option>
                                <option value="25">25</option>
                                <option value="26">26</option>
                                <option value="27">27</option>
                                <option value="28">28</option>
                                <option value="29">29</option>
                                <option value="30">30</option>
                                <option value="31">31</option>
                            </select>
                            <select name="saleDateYear" id="saleDateYear">
                                <option> Year </option>
                                <option value="2015">2015</option>
                                <option value="2016">2016</option>
                                <option value="2017">2017</option>
                                <option value="2018">2018</option>
                                <option value="2019">2019</option>
                                <option value="2020">2020</option>
                                <option value="2021">2021</option>
                                <option value="2022">2022</option>
                                <option value="2023">2023</option>
                                <option value="2024">2024</option>
                                <option value="2025">2025</option>
                            </select>
                            <select name="saleEventTime" id="saleEventTime">
                                <option> Time </option>
                                <option value="00:00:00">12:00am</option>
                                <option value="00:30:00">12:30am</option>
                                <option value="1:00:00">1:00am</option>
                                <option value="1:30:00">1:30am</option>
                                <option value="2:00:00">2:00am</option>
                                <option value="2:30:00">2:30am</option>
                                <option value="3:00:00">3:00am</option>
                                <option value="3:30:00">3:30am</option>
                                <option value="4:00:00">4:00am</option>
                                <option value="4:30:00">4:30am</option>
                                <option value="5:00:00">5:00am</option>
                                <option value="5:30:00">5:30am</option>
                                <option value="6:00:00">6:00am</option>
                                <option value="6:30:00">6:30am</option>
                                <option value="7:00:00">7:00am</option>
                                <option value="7:30:00">7:30am</option>
                                <option value="8:00:00">8:00am</option>
                                <option value="8:30:00">8:30am</option>
                                <option value="9:00:00">9:00am</option>
                                <option value="9:30:00">9:30am</option>
                                <option value="10:00:00">10:00am</option>
                                <option value="10:30:00">10:30am</option>
                                <option value="11:00:00">11:00am</option>
                                <option value="11:30:00">11:30am</option>
                                <option value="12:00:00">12:00pm</option>
                                <option value="12:30:00">12:30pm</option>
                                <option value="13:00:00">1:00pm</option>
                                <option value="13:30:00">1:30pm</option>
                                <option value="14:00:00">2:00pm</option>
                                <option value="14:30:00">2:30pm</option>
                                <option value="15:00:00">3:00pm</option>
                                <option value="15:30:00">3:30pm</option>
                                <option value="16:00:00">4:00pm</option>
                                <option value="16:30:00">4:30pm</option>
                                <option value="17:00:00">5:00pm</option>
                                <option value="17:30:00">5:30pm</option>
                                <option value="18:00:00">6:00pm</option>
                                <option value="18:30:00">6:30pm</option>
                                <option value="19:00:00">7:00pm</option>
                                <option value="19:30:00">7:30pm</option>
                                <option value="20:00:00">8:00pm</option>
                                <option value="20:30:00">8:30pm</option>
                                <option value="21:00:00">9:00pm</option>
                                <option value="21:30:00">9:30pm</option>
                                <option value="22:00:00">10:00pm</option>
                                <option value="22:30:00">10:30pm</option>
                                <option value="23:00:00">11:00pm</option>
                                <option value="23:30:00">11:30pm</option>
                             </select>
                        </div>
                    </div>
                    
                    <div class="form_element">
                        <div class="form_label">
                            Where is your event being held?
                        </div>
                        <div class="form_response">
                            <select name='venueV' id='venueType2'>
                                <option id="selectSecond" selected>--Select One--</option>
                                {foreach $venues as $v}
                                    <option value="{$v.id}">{$v.name}</option>
                                {/foreach}
                                <option value="New">NEW</option>
                            </select>
                        </div>
                    </div>
                
                <br><br>
                <button type="button" class="btn btn-primary back" onclick="prevSlide()" > << Back</button>
                <button type="button" class="btn btn-primary next" onclick="nextSlide()" >Continue >> </button>
                </div>
            </div>
        </div>

        <div style="display:none;" id="16">
            <div class='slide_container transform'> 
                <div class="header alignLeft">
                    Now finally for some advertising information:
                    <div id="progress">4<font color="white">/4</font></div>
                </div>
                <div class="content">
                    <div class="form_element">
                        <div class="form_label">
                            Short description for main event tickets page:
                        </div>
                        <div class="form_response">
                            <textarea
                                class='select-count form-control input-sm'
                                rows = '5'
                                style='width: 300px;'
                                type='text'
                                name='description'
                                min='0'
                                size='30'></textarea>
                        </div>
                    </div>
                    
                    <div class="form_element">
                        <div class="form_label">
                            Excerpt of event/item:
                        </div>
                        <div class="form_response">
                            <input 
                                class='select-count form-control input-sm' 
                                style='width: 300px;'
                                type='text' 
                                name='excerpt'
                                min='0'
                                maxlength='180' 
                                size='30'>
                        </div>
                    </div>
                    
                    <div class="form_element">
                        <div class="form_label">
                            Upload an image for main Events Page:
                        </div>
                        <div class="form_response">
                            <input 
                                class='select-count input-sm' 
                                type='file' 
                                name='thumbnail'
                                id='thumbnail'>
                        </div>
                    </div>
       
		  <br><br>
                <button type="button" class="btn btn-primary back" onclick="prevSlide(15)" > << Back</button>
                <button type="submit" class="btn btn-primary next" >Submit >> </button>
                </div>
            </div>
        </div>
        
         <div style="display:none;" id="6">
            <div class='slide_container transform'> 
                <div class="header alignLeft">
                    Now finally for some advertising information:
                    <div id="progress">4<font color="white">/4</font></div>
                </div>
                <div class="content">
                    <div class="form_element">
                        <div class="form_label">
                            Short description for main event tickets page:
                        </div>
                        <div class="form_response">
                            <textarea
                                class='select-count form-control input-sm'
                                rows = '5'
                                style='width: 300px;'
                                type='text'
                                name='description'
                                min='0'
                                size='30'></textarea>
                        </div>
                    </div>
                    
                    <div class="form_element">
                        <div class="form_label">
                            Excerpt of event/item:
                        </div>
                        <div class="form_response">
                            <input 
                                class='select-count form-control input-sm' 
                                style='width: 300px;'
                                type='text' 
                                name='excerpt'
                                min='0'
                                maxlength='180' 
                                size='30'>
                        </div>
                    </div>
                    
                    <div class="form_element">
                        <div class="form_label">
                            Upload an image for main Events Page:
                        </div>
                        <div class="form_response">
                            <input 
                                class='select-count input-sm' 
                                type='file' 
                                name='thumbnail'>
                        </div>
                    </div>
       
		  <br><br>
                <button type="button" class="btn btn-primary back" onclick="prevSlide()" > << Back</button>
                <button type="submit" class="btn btn-primary next">Submit >> </button> <!-- or make type submit -->
                </div>
            </div>
        </div>

        </form>

        <form 
            id = 'editEvent'
            onsubmit= 'return confirm("Save changes?")'
            action = './?view=admin_creator'
            method='POST'
            enctype='multipart/form-data'>
            <input type='hidden' name='dot' value='save-item'>
            <input type='hidden' name='item_id' id='item_id' value=''>
            <input type='hidden' name='parent_id' id='parent_id' value=''>
            <input type='hidden' name='sale_id' id='sale_id' value=''>

        <div style="display:none;" id="10">
            <div class='slide_container transform'> 
                <div class="header alignLeft">
                    Edit an Event
                </div>
                <div class="content">
                    <div class="form_element">
                        <div class="form_label">
                            Please select the event you want to edit: 
                        </div>
                        <div class="form_response">
                            <select name='itemNames' id='itemNames'> <!-- Eventually, we will want to filter these so that only events from the organizationt that is logged in are actually displayed -->
                                <option id="itemNamesSelect" selected>--Select One--</option>
                                {foreach $items as $i}
                                    <option value="{$i.id}">{$i.name}</option>
                                {/foreach}
                            </select>
                        </div>
                    </div>
		  <br><br>
                <button type="button" class="btn btn-primary back" onclick="prevSlide()" > << Back</button>
                <button type="button" class="btn btn-primary next" onclick="sendItemId()" >Continue >> </button> <!-- Shouldn't just continue, but needs to submit a post var so event gets sent to server -->
                </div>
            </div>
        </div>
        
        <div style="display:none;" id="11">
            <div class='slide_container transform'> 
                <div class="header alignLeft">
                    Event Information
                    <!--<div class="arrow-down" style="float:right; margin-top:15px;">-->
                        <div class="menu_container" onclick="animateMenu(this)">
                            <div class="bar1"></div>
                            <div class="bar2"></div>
                            <div class="bar3"></div>
                        </div>
                    <!--</div>-->
                </div>
                <div class="dropdown-content">
                    <a href="#">Event Information</a>
                    <a href="#" class='parent_delete' onclick="nextSlide(12)">Scheduling</a>
                    <a href="#" class='parent_delete' onclick="nextSlide(13)">Pricing</a>
                    <a href="#" class='child_delete' onclick="nextSlide(14)">Advertising</a>
                    <a href="#" class='child_delete single_delete' onclick="nextSlide(17)">Child Events</a>
                    <a href="#" class='parent_delete single_delete' onclick="sendItemId('parent')">Parent Event</a>
                </div>
                <div class="content">
                    <div class="form_element">
                        <div class="form_label">
                            Event Name:
                        </div>
                        <div class="form_response">
                            <input type="text" name="event_name" id="event_name">
                        </div>
                    </div>
                    
                    <div class="form_element">
                        <div class="form_label">
                            Event Type:
                        </div>
                        <div class="form_response">
                            <select name = 'item_type' id='item_type'>
                                <option selected>--Select One--</option>
                                {foreach $types as $t}
                                    <option value="{$t.id}">{$t.slug}</option>
                                {/foreach}
                            </select>
                        </div>
                    </div>
                    
                    <div class="form_element">
                        <div class="form_label">
                            Event Organization:
                        </div>
                        <div class="form_response">
                            <select name = 'item_org' id='item_org'>
                                <option selected>--Select One--</option>
                                {foreach $organization as $o}
                                    <option value="{$o.id}">{$o.name}</option>
                                {/foreach}
                            </select>
                        </div>
                    </div>
                    
                    <div class="form_element">
                        <div class="form_label">
                            Event Cashnet Item Code:
                        </div>
                        <div class="form_response"> 
                            <select name = 'item_finance' id='item_finance'>
                                <option selected>--Select One--</option>
                                {foreach $cashnetCodes as $c}
                                    <option value="{$c.id}">{$c.cashnet_item_code}</option>
                                {/foreach}
                            </select>
                        </div>
                    </div>
                    
                    <div class="form_element">
                        <div class="form_label">
                            Display on home page?
                        </div>
                        <div class="form_response">
                            <select name = 'display_home' id='display_home'>
                                <option selected>--Select One--</option>
                                <option value="1">Yes</option>
                                <option value="0">No</option>
                            </select>
                        </div>
                    </div>
                    
                    <div class="form_element">
                        <div class="form_label">
                            Tickets sellable?
                        </div>
                        <div class="form_response">
                            <select name = 'sellable' id='sellable'>
                                <option selected>--Select One--</option>
                                <option value="1">Yes</option>
                                <option value="0">No</option>
                            </select>
                        </div>
                    </div>
                    
                    <div class="form_element">
                        <div class="form_label">
                            Store open?
                        </div>
                        <div class="form_response">
                            <select name = 'store_open' id='store_open'>
                                <option selected>--Select One--</option>
                                <option value="1">Yes</option>
                                <option value="0">No</option>
                            </select>
                        </div>
                    </div>
                    
                    <div class="form_element">
                        <div class="form_label">
                            Enable Promo?
                        </div>
                        <div class="form_response">
                            <select name = 'enable_promo' id='enable_promo'>
                                <option selected>--Select One--</option>
                                <option value="1">Yes</option>
                                <option value="0">No</option>
                            </select>
                        </div>
                    </div>
                    
                    <div class="form_element">
                        <div class="form_label">
                            Total ticket count:
                        </div>
                        <div class="form_response">
                            <input type="number" id="total_item_count" name='total_item_count'>
                        </div>
                    </div>
                    
                    <div class="form_element">
                        <div class="form_label">
                            Purchase Limit:
                        </div>
                        <div class="form_response">
                            <input type="number" id="purchase_limit" name='purchase_limit'>
                        </div>
                    </div>
		  <br><br>
                <a href="/admin/?view=admin_creator" class="btn btn-primary next" style="float:right;" >Cancel</a>
                <button type="submit" class="btn btn-primary next" style="float:right; margin-right:3px;" >Save and Return</button>
                </div>
            </div>
        </div>
        
        <div style="display:none;" id="12">
            <div class='slide_container transform'> 
                <div class="header alignLeft">
                    Scheduling
                    <div class="menu_container" onclick="animateMenu(this)">
                        <div class="bar1"></div>
                        <div class="bar2"></div>
                        <div class="bar3"></div>
                    </div>
                </div>
                <div class="dropdown-content">
                    <a href="#" onclick="prevSlide(11)">Event Information</a>
                    <a href="#" class='parent_delete'>Scheduling</a>
                    <a href="#" class='parent_delete' onclick="nextSlide(13)">Pricing</a>
                    <a href="#" class='child_delete' onclick="nextSlide(14)">Advertising</a>
                    <a href="#" class='child_delete single_delete' onclick="nextSlide(17)">Child Events</a>
                    <a href="#" class='parent_delete single_delete' onclick="sendItemId('parent')">Parent Event</a>
                </div>
                <div class="content">
                    <div class="form_element">
                        <div class="form_label">
                            When does your event start?
                        </div>
                        <div class="form_response">
                            <select name="startDateMonth" id="startDateMonthEdit">
                                <option> Month </option>
                                <option value = "01"> January </option>
                                <option value = "02"> February </option>
                                <option value = "03"> March </option>
                                <option value = "04"> April </option>
                                <option value = "05"> May </option>
                                <option value = "06"> June </option>
                                <option value = "07"> July </option>
                                <option value = "08"> August </option>            
                                <option value = "09"> September </option>
                                <option value = "10"> October </option>
                                <option value = "11"> November </option>
                                <option value = "12"> December </option>
                            </select>
                            <select name="startDateDay" id="startDateDayEdit">
                                <option> Day </option>
                                <option value="01">1</option>
                                <option value="02">2</option>
                                <option value="03">3</option>
                                <option value="04">4</option>
                                <option value="05">5</option>
                                <option value="06">6</option>
                                <option value="07">7</option>
                                <option value="08">8</option>
                                <option value="09">9</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                                <option value="13">13</option>
                                <option value="14">14</option>
                                <option value="15">15</option>
                                <option value="16">16</option>
                                <option value="17">17</option>
                                <option value="18">18</option>
                                <option value="19">19</option>
                                <option value="20">20</option>
                                <option value="21">21</option>
                                <option value="22">22</option>
                                <option value="23">23</option>
                                <option value="24">24</option>
                                <option value="25">25</option>
                                <option value="26">26</option>
                                <option value="27">27</option>
                                <option value="28">28</option>
                                <option value="29">29</option>
                                <option value="30">30</option>
                                <option value="31">31</option>
                            </select>
                            <select name="startDateYear" id="startDateYearEdit">
                                <option> Year </option>
                                <option value="2015">2015</option>
                                <option value="2016">2016</option>
                                <option value="2017">2017</option>
                                <option value="2018">2018</option>
                                <option value="2019">2019</option>
                                <option value="2020">2020</option>
                                <option value="2021">2021</option>
                                <option value="2022">2022</option>
                                <option value="2023">2023</option>
                                <option value="2024">2024</option>
                                <option value="2025">2025</option>
                            </select>
                            <select name="startEventTime" id="startEventTimeEdit">
                                <option> Time </option>
                                <option value="00:00:00">12:00am</option>
                                <option value="00:30:00">12:30am</option>
                                <option value="1:00:00">1:00am</option>
                                <option value="1:30:00">1:30am</option>
                                <option value="2:00:00">2:00am</option>
                                <option value="2:30:00">2:30am</option>
                                <option value="3:00:00">3:00am</option>
                                <option value="3:30:00">3:30am</option>
                                <option value="4:00:00">4:00am</option>
                                <option value="4:30:00">4:30am</option>
                                <option value="5:00:00">5:00am</option>
                                <option value="5:30:00">5:30am</option>
                                <option value="6:00:00">6:00am</option>
                                <option value="6:30:00">6:30am</option>
                                <option value="7:00:00">7:00am</option>
                                <option value="7:30:00">7:30am</option>
                                <option value="8:00:00">8:00am</option>
                                <option value="8:30:00">8:30am</option>
                                <option value="9:00:00">9:00am</option>
                                <option value="9:30:00">9:30am</option>
                                <option value="10:00:00">10:00am</option>
                                <option value="10:30:00">10:30am</option>
                                <option value="11:00:00">11:00am</option>
                                <option value="11:30:00">11:30am</option>
                                <option value="12:00:00">12:00pm</option>
                                <option value="12:30:00">12:30pm</option>
                                <option value="13:00:00">1:00pm</option>
                                <option value="13:30:00">1:30pm</option>
                                <option value="14:00:00">2:00pm</option>
                                <option value="14:30:00">2:30pm</option>
                                <option value="15:00:00">3:00pm</option>
                                <option value="15:30:00">3:30pm</option>
                                <option value="16:00:00">4:00pm</option>
                                <option value="16:30:00">4:30pm</option>
                                <option value="17:00:00">5:00pm</option>
                                <option value="17:30:00">5:30pm</option>
                                <option value="18:00:00">6:00pm</option>
                                <option value="18:30:00">6:30pm</option>
                                <option value="19:00:00">7:00pm</option>
                                <option value="19:30:00">7:30pm</option>
                                <option value="20:00:00">8:00pm</option>
                                <option value="20:30:00">8:30pm</option>
                                <option value="21:00:00">9:00pm</option>
                                <option value="21:30:00">9:30pm</option>
                                <option value="22:00:00">10:00pm</option>
                                <option value="22:30:00">10:30pm</option>
                                <option value="23:00:00">11:00pm</option>
                                <option value="23:30:00">11:30pm</option>
                             </select>
                        </div>
                    </div>
                    
                    <div class="form_element">
                        <div class="form_label">
                            When does your event end?
                        </div>
                        <div class="form_response">
                            <select name="endDateMonth" id="endDateMonthEdit">
                                <option> Month </option>
                                <option value = "01"> January </option>
                                <option value = "02"> February </option>
                                <option value = "03"> March </option>
                                <option value = "04"> April </option>
                                <option value = "05"> May </option>
                                <option value = "06"> June </option>
                                <option value = "07"> July </option>
                                <option value = "08"> August </option>            
                                <option value = "09"> September </option>
                                <option value = "10"> October </option>
                                <option value = "11"> November </option>
                                <option value = "12"> December </option>
                            </select>
                            <select name="endDateDay" id="endDateDayEdit">
                                <option> Day </option>
                                <option value="01">1</option>
                                <option value="02">2</option>
                                <option value="03">3</option>
                                <option value="04">4</option>
                                <option value="05">5</option>
                                <option value="06">6</option>
                                <option value="07">7</option>
                                <option value="08">8</option>
                                <option value="09">9</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                                <option value="13">13</option>
                                <option value="14">14</option>
                                <option value="15">15</option>
                                <option value="16">16</option>
                                <option value="17">17</option>
                                <option value="18">18</option>
                                <option value="19">19</option>
                                <option value="20">20</option>
                                <option value="21">21</option>
                                <option value="22">22</option>
                                <option value="23">23</option>
                                <option value="24">24</option>
                                <option value="25">25</option>
                                <option value="26">26</option>
                                <option value="27">27</option>
                                <option value="28">28</option>
                                <option value="29">29</option>
                                <option value="30">30</option>
                                <option value="31">31</option>
                            </select>
                            <select name="endDateYear" id="endDateYearEdit">
                                <option> Year </option>
                                <option value="2015">2015</option>
                                <option value="2016">2016</option>
                                <option value="2017">2017</option>
                                <option value="2018">2018</option>
                                <option value="2019">2019</option>
                                <option value="2020">2020</option>
                                <option value="2021">2021</option>
                                <option value="2022">2022</option>
                                <option value="2023">2023</option>
                                <option value="2024">2024</option>
                                <option value="2025">2025</option>
                            </select>
                            <select name="endEventTime" id="endEventTimeEdit">
                                <option> Time </option>
                                <option value="00:00:00">12:00am</option>
                                <option value="00:30:00">12:30am</option>
                                <option value="1:00:00">1:00am</option>
                                <option value="1:30:00">1:30am</option>
                                <option value="2:00:00">2:00am</option>
                                <option value="2:30:00">2:30am</option>
                                <option value="3:00:00">3:00am</option>
                                <option value="3:30:00">3:30am</option>
                                <option value="4:00:00">4:00am</option>
                                <option value="4:30:00">4:30am</option>
                                <option value="5:00:00">5:00am</option>
                                <option value="5:30:00">5:30am</option>
                                <option value="6:00:00">6:00am</option>
                                <option value="6:30:00">6:30am</option>
                                <option value="7:00:00">7:00am</option>
                                <option value="7:30:00">7:30am</option>
                                <option value="8:00:00">8:00am</option>
                                <option value="8:30:00">8:30am</option>
                                <option value="9:00:00">9:00am</option>
                                <option value="9:30:00">9:30am</option>
                                <option value="10:00:00">10:00am</option>
                                <option value="10:30:00">10:30am</option>
                                <option value="11:00:00">11:00am</option>
                                <option value="11:30:00">11:30am</option>
                                <option value="12:00:00">12:00pm</option>
                                <option value="12:30:00">12:30pm</option>
                                <option value="13:00:00">1:00pm</option>
                                <option value="13:30:00">1:30pm</option>
                                <option value="14:00:00">2:00pm</option>
                                <option value="14:30:00">2:30pm</option>
                                <option value="15:00:00">3:00pm</option>
                                <option value="15:30:00">3:30pm</option>
                                <option value="16:00:00">4:00pm</option>
                                <option value="16:30:00">4:30pm</option>
                                <option value="17:00:00">5:00pm</option>
                                <option value="17:30:00">5:30pm</option>
                                <option value="18:00:00">6:00pm</option>
                                <option value="18:30:00">6:30pm</option>
                                <option value="19:00:00">7:00pm</option>
                                <option value="19:30:00">7:30pm</option>
                                <option value="20:00:00">8:00pm</option>
                                <option value="20:30:00">8:30pm</option>
                                <option value="21:00:00">9:00pm</option>
                                <option value="21:30:00">9:30pm</option>
                                <option value="22:00:00">10:00pm</option>
                                <option value="22:30:00">10:30pm</option>
                                <option value="23:00:00">11:00pm</option>
                                <option value="23:30:00">11:30pm</option>
                             </select>
                        </div>
                    </div>
                    
                    <div class="form_element">
                        <div class="form_label">
                            When do you want tickets to go on sale for your event?
                        </div>
                        <div class="form_response">
                            <select name="saleDateMonth" id="saleDateMonthEdit">
                                <option> Month </option>
                                <option value = "01"> January </option>
                                <option value = "02"> February </option>
                                <option value = "03"> March </option>
                                <option value = "04"> April </option>
                                <option value = "05"> May </option>
                                <option value = "06"> June </option>
                                <option value = "07"> July </option>
                                <option value = "08"> August </option>            
                                <option value = "09"> September </option>
                                <option value = "10"> October </option>
                                <option value = "11"> November </option>
                                <option value = "12"> December </option>
                            </select>
                            <select name="saleDateDay" id="saleDateDayEdit">
                                <option> Day </option>
                                <option value="01">1</option>
                                <option value="02">2</option>
                                <option value="03">3</option>
                                <option value="04">4</option>
                                <option value="05">5</option>
                                <option value="06">6</option>
                                <option value="07">7</option>
                                <option value="08">8</option>
                                <option value="09">9</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                                <option value="13">13</option>
                                <option value="14">14</option>
                                <option value="15">15</option>
                                <option value="16">16</option>
                                <option value="17">17</option>
                                <option value="18">18</option>
                                <option value="19">19</option>
                                <option value="20">20</option>
                                <option value="21">21</option>
                                <option value="22">22</option>
                                <option value="23">23</option>
                                <option value="24">24</option>
                                <option value="25">25</option>
                                <option value="26">26</option>
                                <option value="27">27</option>
                                <option value="28">28</option>
                                <option value="29">29</option>
                                <option value="30">30</option>
                                <option value="31">31</option>
                            </select>
                            <select name="saleDateYear" id="saleDateYearEdit">
                                <option> Year </option>
                                <option value="2015">2015</option>
                                <option value="2016">2016</option>
                                <option value="2017">2017</option>
                                <option value="2018">2018</option>
                                <option value="2019">2019</option>
                                <option value="2020">2020</option>
                                <option value="2021">2021</option>
                                <option value="2022">2022</option>
                                <option value="2023">2023</option>
                                <option value="2024">2024</option>
                                <option value="2025">2025</option>
                            </select>
                            <select name="saleEventTime" id="saleEventTimeEdit">
                                <option> Time </option>
                                <option value="00:00:00">12:00am</option>
                                <option value="00:30:00">12:30am</option>
                                <option value="1:00:00">1:00am</option>
                                <option value="1:30:00">1:30am</option>
                                <option value="2:00:00">2:00am</option>
                                <option value="2:30:00">2:30am</option>
                                <option value="3:00:00">3:00am</option>
                                <option value="3:30:00">3:30am</option>
                                <option value="4:00:00">4:00am</option>
                                <option value="4:30:00">4:30am</option>
                                <option value="5:00:00">5:00am</option>
                                <option value="5:30:00">5:30am</option>
                                <option value="6:00:00">6:00am</option>
                                <option value="6:30:00">6:30am</option>
                                <option value="7:00:00">7:00am</option>
                                <option value="7:30:00">7:30am</option>
                                <option value="8:00:00">8:00am</option>
                                <option value="8:30:00">8:30am</option>
                                <option value="9:00:00">9:00am</option>
                                <option value="9:30:00">9:30am</option>
                                <option value="10:00:00">10:00am</option>
                                <option value="10:30:00">10:30am</option>
                                <option value="11:00:00">11:00am</option>
                                <option value="11:30:00">11:30am</option>
                                <option value="12:00:00">12:00pm</option>
                                <option value="12:30:00">12:30pm</option>
                                <option value="13:00:00">1:00pm</option>
                                <option value="13:30:00">1:30pm</option>
                                <option value="14:00:00">2:00pm</option>
                                <option value="14:30:00">2:30pm</option>
                                <option value="15:00:00">3:00pm</option>
                                <option value="15:30:00">3:30pm</option>
                                <option value="16:00:00">4:00pm</option>
                                <option value="16:30:00">4:30pm</option>
                                <option value="17:00:00">5:00pm</option>
                                <option value="17:30:00">5:30pm</option>
                                <option value="18:00:00">6:00pm</option>
                                <option value="18:30:00">6:30pm</option>
                                <option value="19:00:00">7:00pm</option>
                                <option value="19:30:00">7:30pm</option>
                                <option value="20:00:00">8:00pm</option>
                                <option value="20:30:00">8:30pm</option>
                                <option value="21:00:00">9:00pm</option>
                                <option value="21:30:00">9:30pm</option>
                                <option value="22:00:00">10:00pm</option>
                                <option value="22:30:00">10:30pm</option>
                                <option value="23:00:00">11:00pm</option>
                                <option value="23:30:00">11:30pm</option>
                             </select>
                        </div>
                    </div>

                    <div class="form_element">
                        <div class="form_label">
                            When do you want tickets to stop selling for your event?
                        </div>
                        <div class="form_response">
                            <select name="saleDateMonthEnd" id="saleEndDateMonthEdit">
                                <option> Month </option>
                                <option value = "01"> January </option>
                                <option value = "02"> February </option>
                                <option value = "03"> March </option>
                                <option value = "04"> April </option>
                                <option value = "05"> May </option>
                                <option value = "06"> June </option>
                                <option value = "07"> July </option>
                                <option value = "08"> August </option>            
                                <option value = "09"> September </option>
                                <option value = "10"> October </option>
                                <option value = "11"> November </option>
                                <option value = "12"> December </option>
                            </select>
                            <select name="saleDateDayEnd" id="saleEndDateDayEdit">
                                <option> Day </option>
                                <option value="01">1</option>
                                <option value="02">2</option>
                                <option value="03">3</option>
                                <option value="04">4</option>
                                <option value="05">5</option>
                                <option value="06">6</option>
                                <option value="07">7</option>
                                <option value="08">8</option>
                                <option value="09">9</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                                <option value="13">13</option>
                                <option value="14">14</option>
                                <option value="15">15</option>
                                <option value="16">16</option>
                                <option value="17">17</option>
                                <option value="18">18</option>
                                <option value="19">19</option>
                                <option value="20">20</option>
                                <option value="21">21</option>
                                <option value="22">22</option>
                                <option value="23">23</option>
                                <option value="24">24</option>
                                <option value="25">25</option>
                                <option value="26">26</option>
                                <option value="27">27</option>
                                <option value="28">28</option>
                                <option value="29">29</option>
                                <option value="30">30</option>
                                <option value="31">31</option>
                            </select>
                            <select name="saleDateYearEnd" id="saleEndDateYearEdit">
                                <option> Year </option>
                                <option value="2015">2015</option>
                                <option value="2016">2016</option>
                                <option value="2017">2017</option>
                                <option value="2018">2018</option>
                                <option value="2019">2019</option>
                                <option value="2020">2020</option>
                                <option value="2021">2021</option>
                                <option value="2022">2022</option>
                                <option value="2023">2023</option>
                                <option value="2024">2024</option>
                                <option value="2025">2025</option>
                            </select>
                            <select name="saleEventTimeEnd" id="saleEndEventTimeEdit">
                                <option> Time </option>
                                <option value="00:00:00">12:00am</option>
                                <option value="00:30:00">12:30am</option>
                                <option value="1:00:00">1:00am</option>
                                <option value="1:30:00">1:30am</option>
                                <option value="2:00:00">2:00am</option>
                                <option value="2:30:00">2:30am</option>
                                <option value="3:00:00">3:00am</option>
                                <option value="3:30:00">3:30am</option>
                                <option value="4:00:00">4:00am</option>
                                <option value="4:30:00">4:30am</option>
                                <option value="5:00:00">5:00am</option>
                                <option value="5:30:00">5:30am</option>
                                <option value="6:00:00">6:00am</option>
                                <option value="6:30:00">6:30am</option>
                                <option value="7:00:00">7:00am</option>
                                <option value="7:30:00">7:30am</option>
                                <option value="8:00:00">8:00am</option>
                                <option value="8:30:00">8:30am</option>
                                <option value="9:00:00">9:00am</option>
                                <option value="9:30:00">9:30am</option>
                                <option value="10:00:00">10:00am</option>
                                <option value="10:30:00">10:30am</option>
                                <option value="11:00:00">11:00am</option>
                                <option value="11:30:00">11:30am</option>
                                <option value="12:00:00">12:00pm</option>
                                <option value="12:30:00">12:30pm</option>
                                <option value="13:00:00">1:00pm</option>
                                <option value="13:30:00">1:30pm</option>
                                <option value="14:00:00">2:00pm</option>
                                <option value="14:30:00">2:30pm</option>
                                <option value="15:00:00">3:00pm</option>
                                <option value="15:30:00">3:30pm</option>
                                <option value="16:00:00">4:00pm</option>
                                <option value="16:30:00">4:30pm</option>
                                <option value="17:00:00">5:00pm</option>
                                <option value="17:30:00">5:30pm</option>
                                <option value="18:00:00">6:00pm</option>
                                <option value="18:30:00">6:30pm</option>
                                <option value="19:00:00">7:00pm</option>
                                <option value="19:30:00">7:30pm</option>
                                <option value="20:00:00">8:00pm</option>
                                <option value="20:30:00">8:30pm</option>
                                <option value="21:00:00">9:00pm</option>
                                <option value="21:30:00">9:30pm</option>
                                <option value="22:00:00">10:00pm</option>
                                <option value="22:30:00">10:30pm</option>
                                <option value="23:00:00">11:00pm</option>
                                <option value="23:30:00">11:30pm</option>
                             </select>
                        </div>
                    </div>

                    <div class="form_element">
                        <div class="form_label">
                            Where is your event being held?
                        </div>
                        <div class="form_response">
                            <select name='venueV' id='venueTypeEdit'>
                                <option id="selectSecond" selected>--Select One--</option>
                                {foreach $venues as $v}
                                    <option value="{$v.id}">{$v.name}</option>
                                {/foreach}
                                <option value="New">NEW</option>
                            </select>
                        </div>
                    </div>
		  <br><br>
                <a href="/admin/?view=admin_creator" class="btn btn-primary next" style="float:right;" >Cancel</a>
                <button type="submit" class="btn btn-primary next" style="float:right; margin-right:3px;">Save and Return</button>
                </div>
            </div>
        </div>
        
         <div style="display:none;" id="13">
            <div class='slide_container transform'> 
                <div class="header alignLeft">
                    Pricing
                    <div class="menu_container" onclick="animateMenu(this)">
                        <div class="bar1"></div>
                        <div class="bar2"></div>
                        <div class="bar3"></div>
                    </div>
                </div>
                <div class="dropdown-content">
                    <a href="#" onclick="prevSlide(11);">Event Information</a>
                    <a href="#" class='parent_delete' onclick="prevSlide(12);">Scheduling</a>
                    <a href="#" class='parent_delete' >Pricing</a>
                    <a href="#" class='child_delete' onclick="nextSlide(14);">Advertising</a>
                    <a href="#" class='child_delete single_delete' onclick="nextSlide(17)">Child Events</a>
                    <a href="#" class='parent_delete single_delete' onclick="sendItemId('parent')">Parent Event</a>
                </div>
                <div class="content">
                    
                    <div class="form_element">
                        <div class="form_label">
                            How many different types of tickets will you be selling?
                        </div>
                        <div class="form_response">
                            <select name="numItemPrices" id="numItemPrices"  onchange="updateItemPrices();">
                                <option> Number of Types of Tickets </option>
                                <option value = "1"> 1 </option>
                                <option value = "2"> 2 </option>
                                <option value = "3"> 3 </option>
                                <option value = "4"> 4 </option>
                                <option value = "5"> 5 </option>
                                <option value = "6"> 6 </option>
                                <option value = "7"> 7 </option>
                                <option value = "8"> 8 </option>            
                                <option value = "9"> 9 </option>
                            </select>   
                        </div>
                    </div>
                    
                    <div class="changeHeight" id="item_prices"></div>
		  <br><br>
                <!--<button type="button" class="btn btn-primary next" style="float:right;" onclick="nextSlide(1)" >Cancel</button>-->
                <a href="/admin/?view=admin_creator" class="btn btn-primary next" style="float:right;" >Cancel</a>
                <button type="submit" class="btn btn-primary next" style="float:right; margin-right:3px;" >Save and Return</button>
                </div>
            </div>
        </div>
        
        <div style="display:none;" id="14">
            <div class='slide_container transform'> 
                <div class="header alignLeft">
                    Advertising
                    <div class="menu_container" onclick="animateMenu(this)">
                        <div class="bar1"></div>
                        <div class="bar2"></div>
                        <div class="bar3"></div>
                    </div>
                </div>
                <div class="dropdown-content">
                    <a href="#" onclick="prevSlide(11);">Event Information</a>
                    <a href="#" class='parent_delete' onclick="prevSlide(12);">Scheduling</a>
                    <a href="#" class='parent_delete' onclick="prevSlide(13);">Pricing</a>
                    <a href="#" class='child_delete' >Advertising</a>
                    <a href="#" class='child_delete single_delete' onclick="nextSlide(17)">Child Events</a>
                    <a href="#" class='parent_delete single_delete' onclick="sendItemId('parent')">Parent Event</a>
                </div>
                <div class="content">
                    <div class="form_element">
                        <div class="form_label">
                            Short description for main event tickets page:
                        </div>
                        <div class="form_response">
                            <textarea
                                class='select-count form-control input-sm'
                                rows = '5'
                                style='width: 300px;'
                                type='text'
                                name='description'
                                id='short_description_edit'
                                min='0'
                                size='30'></textarea>
                        </div>
                    </div>
                    
                    <div class="form_element">
                        <div class="form_label">
                            Excerpt of event/item:
                        </div>
                        <div class="form_response">
                            <input 
                                class='select-count form-control input-sm' 
                                style='width: 300px;'
                                type='text' 
                                name='excerpt'
                                min='0'
                                id="excerpt_edit"
                                maxlength='180' 
                                size='30'>
                        </div>
                    </div>
                    
                    <div class="form_element">
                        <div class="form_label">
                            Upload a different image for main Events Page:
                        </div>
                        <div class="form_response">
                            <input 
                                class='select-count input-sm' 
                                type='file' 
                                name='thumbnail'
                                id='thumbnail'>
                        </div>
                    </div>
		  <br><br>
                <a href="/admin/?view=admin_creator" class="btn btn-primary next" style="float:right;" >Cancel</a>
                <button type="submit" class="btn btn-primary next" style="float:right; margin-right:3px;">Save and Return</button>
                </div>
            </div>
        </div>

        <div style="display:none;" id="17">
            <div class='slide_container transform'> 
                <div class="header alignLeft">
                    Edit Child Event
                    <div class="menu_container" onclick="animateMenu(this)">
                        <div class="bar1"></div>
                        <div class="bar2"></div>
                        <div class="bar3"></div>
                    </div>
                </div>
                <div class="dropdown-content">
                    <a href="#" onclick="prevSlide(11);">Event Information</a>
                    <a href="#" class='parent_delete' onclick="prevSlide(12);">Scheduling</a>
                    <a href="#" class='parent_delete' onclick="prevSlide(13);">Pricing</a>
                    <a href="#" class='child_delete' onclick="prevSlide(14);">Advertising</a>
                    <a href="#" class='child_delete single_delete'>Child Events</a>
                    <a href="#" class='parent_delete single_delete' onclick="sendItemId('parent')">Parent Event</a>
                </div>
                <div class="content">
                    <div class="form_element">
                        <div class="form_label">
                            Please select the child event you want to edit:
                        </div>
                        <div class="form_response">
                            <select name="child_events" id="child_events">     
                            </select>
                        </div>
                    </div>
          <br><br>
                <a href="/admin/?view=admin_creator" class="btn btn-primary next" style="float:right;" >Cancel</a>
                <a class="btn btn-primary next" style="float:right; margin-right:3px;" onclick="sendItemId('child')">Continue >> </a>
                </div>
            </div>
        </div>

        </form>
        
        <!-- TEMPLATE -->
        <div style="display:none;">
            <div class='slide_container transform'> 
                <div class="header alignLeft">
                    Let's start out with some basic information...
                    <div id="progress">1<font color="white">/5</font></div>
                </div>
                <div class="content">
                    <div class="form_element">
                        <div class="form_label">
                            What is the name of your event?
                        </div>
                        <div class="form_response">
                            <input type="text" placeholder="Event Name"> 
                        </div>
                    </div>
		  <br><br>
                <button type="button" class="btn btn-primary back" onclick="prevSlide()" > << Back</button>
                <button type="button" class="btn btn-primary next" onclick="nextSlide()" >Continue >> </button>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
