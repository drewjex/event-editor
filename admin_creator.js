current_slide = 1;
trail = [];
total_slides = document.getElementsByClassName("slide_container").length;

createSlide('1', 0);
document.getElementById((current_slide).toString()).remove();

createTicketOptions(9);
createItemPriceOptions(10);

function createSlide(slide_to_create, init_position) {
  var slide = document.createElement('div');
  slide.innerHTML = document.getElementById(slide_to_create).innerHTML;
  slide.children[0].style.transform = "translate("+init_position+"px, 0)";
  slide.children[0].id = "slide"+slide_to_create;
  if (slide_to_create > 10 && slide_to_create < 15) {
    document.getElementById('editEvent').appendChild(slide);
  } else {
    document.getElementById('createEvent').appendChild(slide);
  }
}

function incrementCounter() {
    var jump = 1;
    if (current_slide == 1) {
        var eventOptions = document.getElementById('eventOptions').value;
        if (eventOptions == "create") {

        } else if (eventOptions == "edit") {
            jump = 9;
        }
    } else if (current_slide == 2) {
        var radios = document.getElementsByName('eventType');
		for (var i = 0, length = radios.length; i < length; i++) {
			if (radios[i].checked) {
                if (radios[i].value == "multi") {
                    jump = 2;
                }
				break;
			}
		}
    } else if (current_slide == 3) { 
        jump = 2;
    } 
    current_slide += jump;
    trail.push(jump);
}

function nextSlide() {
  $(".dropdown-content").removeClass("change");
  $(".menu_container").removeClass("change");
  var exit_slide = document.getElementById("slide"+current_slide);
  if (arguments.length == 0) {
    incrementCounter();   
  } else if (arguments.length == 1) {
    current_slide = arguments[0];
  }
  exit_slide.style.transform = "translate("+((window.innerWidth/2)+(exit_slide.offsetWidth/2))+"px,0)"; //move current slide
  if (!document.getElementById("slide"+current_slide)) {
    createSlide((current_slide).toString(), -((window.innerWidth/2)+(exit_slide.offsetWidth/2)));
    document.getElementById((current_slide).toString()).remove();
  } else {
    document.getElementById("slide"+current_slide).style.transform = "translate("+(-((window.innerWidth/2)+(exit_slide.offsetWidth/2)))+"px, 0)";
  }
  var enter_slide = document.getElementById("slide"+current_slide);
  setTimeout(function() {
        exit_slide.style.display = "none";
        enter_slide.style.display = "block";
  }, 1000);
  setTimeout(function() {
      enter_slide.style.transform = "translate(0px,0)"; //move current slide
  },1050);
}

function prevSlide() {
  $(".dropdown-content").removeClass("change");   
  $(".menu_container").removeClass("change"); 
  var exit_slide = document.getElementById("slide"+current_slide);
  exit_slide.style.transform = "translate("+(-((window.innerWidth/2)+(exit_slide.offsetWidth/2)))+"px, 0)";
  if (arguments.length == 0) {
    current_slide -= trail.pop(); //decrement   
  } else if (arguments.length == 1){
    current_slide = arguments[0]; //has problems though with the trail.pop() thing.
  }
  var enter_slide = document.getElementById("slide"+current_slide); //should always have been created already.
  if (enter_slide == null) {
      //create it
      createSlide((current_slide).toString(), ((window.innerWidth/2)+(exit_slide.offsetWidth/2)));
      document.getElementById((current_slide).toString()).remove();
      enter_slide = document.getElementById("slide"+current_slide);
  }
  setTimeout(function() {
    exit_slide.style.display = "none";
    enter_slide.style.display = "block";
  }, 1000);
  setTimeout(function() {
      enter_slide.style.transform = "translate(0px,0)"; //move current slide
  },1050);
}

function animateMenu(x) {
    x.classList.toggle("change");
    $(".dropdown-content").toggleClass("change");
}

Element.prototype.remove = function() {
  this.parentElement.removeChild(this);
}

NodeList.prototype.remove = HTMLCollection.prototype.remove = function() {
  for (var i = this.length - 1; i >= 0; i--) {
    if (this[i] && this[i].parentElement) {
      this[i].parentElement.removeChild(this[i]);
    }
  }
}

function updateTicketTypes() {
  var numTickets = document.getElementById('numTickets').value;
  if (isNaN(numTickets))
    numTickets = 0;
  var height_of_div = (document.getElementById('ticketText1').offsetHeight) + (document.getElementById('ticketDiv1').offsetHeight)+16;
  document.getElementById('number_of_tickets').style.maxHeight = (numTickets * height_of_div) + "px"; //116 //also i could make visibility:hidden for items that are not showing.
}

function updateChildNames() {
    var numChildren = document.getElementById('num_child_events').value;
    if (isNaN(numChildren))
        numChildren = 0;
    createChildOptions(numChildren);
}

function createChildOptions(numChildren) {
  var delete_season_pass = document.getElementById("seasonPass");
  var delete_season_text = document.getElementById("seasonText");
  if (delete_season_pass !== null) {
    delete_season_pass.remove();
    delete_season_text.remove();
  }
  for (var i = 1; i<1000; i++) {
      var div_to_delete = document.getElementById("childName"+i);
      var text_to_delete = document.getElementById("childText"+i);
      if (div_to_delete !== null) {
          div_to_delete.remove();
          text_to_delete.remove();
      } else {
          break; //break the loop when we reach the end.
      }
  }

  createSeasonPassOptions();

  for (var i = 1; i <= numChildren; i++) {
    var p = document.createElement('p');
    p.setAttribute("id", "childText"+i);
    var t = document.createTextNode("Event Number " + i);
    p.style.fontSize = "15px";
    p.style = "border-top-left-radius:5px; border-top-right-radius:5px; background-color:#428bca; color:white; padding:10px; margin-bottom:-3px; width:150px; text-align:center;"; /* #428bca #F5F5F5 */
    p.appendChild(t);
    var v = document.createElement('div');
    v.setAttribute("id", "childName"+i);
    v.innerHTML = document.getElementById('childEventsElement').innerHTML;
    //so now here, we need to change the ids and names of the 4 inputs inside the div. ticketType
    v.querySelector(".child_name").setAttribute("name", "child_name"+i); 
    v.querySelector(".child_ticket_number").setAttribute("name", "child_ticket_number"+i);
    v.querySelector(".child_num_ticket_types").setAttribute("name", "child_num_ticket_types"+i);
    v.querySelector(".changeHeight").setAttribute("id", "ticket_container"+i);
    v.querySelector(".typeofticket").setAttribute("id", "type_of_ticket"+i);
    v.querySelector(".startDateMonth").setAttribute("name", "startDateMonth"+i);
    v.querySelector(".startDateDay").setAttribute("name", "startDateDay"+i);
    v.querySelector(".startDateYear").setAttribute("name", "startDateYear"+i);
    v.querySelector(".startEventTime").setAttribute("name", "startEventTime"+i);
    v.querySelector(".endDateMonth").setAttribute("name", "endDateMonth"+i);
    v.querySelector(".endDateDay").setAttribute("name", "endDateDay"+i);
    v.querySelector(".endDateYear").setAttribute("name", "endDateYear"+i);
    v.querySelector(".endEventTime").setAttribute("name", "endEventTime"+i);
    v.querySelector(".saleDateMonth").setAttribute("name", "saleDateMonth"+i);
    v.querySelector(".saleDateDay").setAttribute("name", "saleDateDay"+i);
    v.querySelector(".saleDateYear").setAttribute("name", "saleDateYear"+i);
    v.querySelector(".saleEventTime").setAttribute("name", "saleEventTime"+i);
    v.querySelector(".venueV").setAttribute("name", "venueV"+i);
    v.style = "border:0px solid #ccc; border-radius:0px 5px 5px 5px; padding:5px; margin-bottom:20px; background-color:#F5F5F5; display:inline-block; width:100%;";
    document.getElementById('number_of_children').appendChild(p);
    document.getElementById('number_of_children').appendChild(v);
  }
  $(document).on('change', '.child_num_ticket_types', function() {
        var id = this.name.substr(this.name.length - 1);
        createChildTicketOptions(id, this.value);
        //now with the id, we can change the length of the thing and make everyting work. Mwahaha!!
        var height_of_div = (document.getElementById('ticketText'+id+"_1").offsetHeight) + (document.getElementById('ticketDiv'+id+'_1').offsetHeight)+16;
        document.getElementById('ticket_container'+id).style.maxHeight = (this.value * height_of_div) + "px"; //i probably don't need all the extra stuff below in the HTML...
  });
  $(document).on('change', '.startDateMonth', function() {
      $('[name="endDateMonth'+this.name.substr(this.name.length - 1)+'"]').val($(this).val());  //send end to the same value as beginning by default - make sure it happens in both single/multi events
  });
  $(document).on('change', '.startDateDay', function() {
    $('[name="endDateDay'+this.name.substr(this.name.length - 1)+'"]').val($(this).val());
  });
  $(document).on('change', '.startDateYear', function() {
    $('[name="endDateYear'+this.name.substr(this.name.length - 1)+'"]').val($(this).val()); 
  });
  $(document).on('change', '.startEventTime', function() {
    $('[name="endEventTime'+this.name.substr(this.name.length - 1)+'"]').val($(this).val()); 
  });
}

function createChildTicketOptions(id, numTickets) {
  for (var i = 1; i<1000; i++) {
      var div_to_delete = document.getElementById("ticketDiv"+id+"_"+i);
      var text_to_delete = document.getElementById("ticketText"+id+"_"+i);
      if (div_to_delete !== null) {
          div_to_delete.remove();
          text_to_delete.remove();
      } else {
          break; //break the loop when we reach the end.
      }
  }  
  for (var i = 1; i <= numTickets; i++) {
    document.getElementById('ticket_container'+id).style = "max-height:0; overflow:hidden;";
    var p = document.createElement('p');
    p.setAttribute("id", "ticketText"+id+"_"+i);
    var t = document.createTextNode("Ticket Number " + i);
    p.style.fontSize = "15px";
    p.style = "border-top-left-radius:5px; border-top-right-radius:5px; background-color:#428bca; color:#ccff33; padding:5px; margin-bottom:-3px; width:125px; text-align:center;"; /* #428bca #F5F5F5 */
    p.appendChild(t);
    var v = document.createElement('div');
    v.setAttribute("id", "ticketDiv"+id+"_"+i);
    v.innerHTML = document.getElementById('typeofticket').innerHTML;
    //so now here, we need to change the ids and names of the 4 inputs inside the div. ticketType
    v.querySelector(".ticketName").setAttribute("name", "ticketName"+id+"_"+i);
    v.querySelector(".ticketType").setAttribute("name", "ticketType"+id+"_"+i); 
    v.querySelector(".patronProfile").setAttribute("name", "patronProfile"+id+"_"+i);
    v.querySelector(".ticketPrice").setAttribute("name", "ticketPrice"+id+"_"+i);
    v.querySelector(".numTicketsOfType").setAttribute("name", "numTicketsOfType"+id+"_"+i);
    v.querySelector(".numTicketsPerPerson").setAttribute("name", "numTicketsPerPerson"+id+"_"+i);
    v.style = "border:0px solid #ccc; border-radius:0px 5px 5px 5px; padding:5px; margin-bottom:20px; background-color:#fff; display:inline-block; width:100%;";
    document.getElementById('ticket_container'+id).appendChild(p);
    document.getElementById('ticket_container'+id).appendChild(v);
  }
}


function createTicketOptions(numTickets) {
  for (var i = 1; i <= numTickets; i++) {
    var p = document.createElement('p');
    p.setAttribute("id", "ticketText"+i);
    var t = document.createTextNode("Ticket Number " + i);
    p.style.fontSize = "15px";
    p.style = "border-top-left-radius:5px; border-top-right-radius:5px; background-color:#428bca; color:white; padding:5px; margin-bottom:-3px; width:125px; text-align:center;"; /* #428bca #F5F5F5 */
    p.appendChild(t);
    var v = document.createElement('div');
    v.setAttribute("id", "ticketDiv"+i);
    v.innerHTML = document.getElementById('typeofticket').innerHTML;
    //so now here, we need to change the ids and names of the 4 inputs inside the div. ticketType
    v.querySelector(".ticketName").setAttribute("name", "ticketName"+i);
    v.querySelector(".ticketType").setAttribute("name", "ticketType"+i); 
    v.querySelector(".patronProfile").setAttribute("name", "patronProfile"+i);
    v.querySelector(".ticketPrice").setAttribute("name", "ticketPrice"+i);
    v.querySelector(".numTicketsOfType").setAttribute("name", "numTicketsOfType"+i);
    v.querySelector(".numTicketsPerPerson").setAttribute("name", "numTicketsPerPerson"+i);
    v.style = "border:0px solid #ccc; border-radius:0px 5px 5px 5px; padding:5px; margin-bottom:20px; background-color:#F5F5F5; display:inline-block; width:100%;";
    document.getElementById('number_of_tickets').appendChild(p);
    document.getElementById('number_of_tickets').appendChild(v);
  }
}

function createSeasonPassOptions(){
  var seasontix = $('input[type="radio"][name="season-tix"]:checked').val();
  if(seasontix != "season"){
    return false;
  }
  var p = document.createElement('p');
  p.setAttribute("id", "seasonText");
  var t = document.createTextNode("Season Pass");
  p.style.fontSize = "15px";
  p.style = "border-top-left-radius:5px; border-top-right-radius:5px; background-color:#428bca; color:white; padding:10px; margin-bottom:-3px; width:150px; text-align:center;"; /* #428bca #F5F5F5 */
  p.appendChild(t);
  var v = document.createElement('div');
  v.setAttribute("id", "seasonPass");
  v.innerHTML = document.getElementById('childEventsElement').innerHTML;
  //so now here, we need to change the ids and names of the 4 inputs inside the div. ticketType
  var endsale = v.querySelector(".saleDateMonth").closest('.form_element').cloneNode(true);
  endsale.querySelector(".form_label").innerHTML = "When do you want season passes to stop being sold for your event?";
  endsale.querySelector(".saleDateMonth").setAttribute("class", "endSaleDateMonth");
  endsale.querySelector(".endSaleDateMonth").setAttribute("name", "endSaleDateMonthSeason");
  endsale.querySelector(".saleDateDay").setAttribute("class", "endSaleDateDay");
  endsale.querySelector(".endSaleDateDay").setAttribute("name", "endSaleDateDaySeason");
  endsale.querySelector(".saleDateYear").setAttribute("class", "endSaleDateYear");
  endsale.querySelector(".endSaleDateYear").setAttribute("name", "endSaleDateYearSeason");
  endsale.querySelector(".saleEventTime").setAttribute("class", "endSaleEventTime");
  endsale.querySelector(".endSaleEventTime").setAttribute("name", "endSaleEventTimeSeason");

  var pricing = v.querySelector(".child_num_ticket_types").closest('.form_element').cloneNode(true);
  pricing.querySelector(".form_label").innerHTML = "What is the price for the season passes?"
  pricing.querySelector(".form_response").innerHTML = "<input type='number' min='0.00' step='0.01' max='2500' class='ticketPrice' name='seasonPrice'>";

  var sellnum = v.querySelector(".child_name").closest('.form_element').cloneNode(true);
  sellnum.querySelector(".form_label").innerHTML = "How many season passes do you want to sell?";
  sellnum.querySelector(".form_response").innerHTML = "<input type='number' class='numTicketsOfType' name='numTicketsOfSeason'>";

  var sellpersonnum = v.querySelector(".child_name").closest('.form_element').cloneNode(true);
  sellpersonnum.querySelector(".form_label").innerHTML = "Max number of season passes per person <small>(-1 = unlimited)</small>";
  sellpersonnum.querySelector(".form_response").innerHTML = "<input type='number' class='numTicketsPerPerson' name='numSeasonPerPerson'>";


  v.querySelector(".child_name").closest('.form_element').remove(); 
  v.querySelector(".child_ticket_number").closest('.form_element').remove();
  v.querySelector(".child_num_ticket_types").closest('.form_element').remove();
  v.querySelector(".changeHeight").remove();
  v.querySelector(".typeofticket").remove();
  v.querySelector(".startDateMonth").closest('.form_element').remove();
  v.querySelector(".endDateMonth").closest('.form_element').remove();
  v.querySelector(".saleDateMonth").setAttribute("name", "saleDateMonthSeason");
  v.querySelector(".saleDateDay").setAttribute("name", "saleDateDaySeason");
  v.querySelector(".saleDateYear").setAttribute("name", "saleDateYearSeason");
  v.querySelector(".saleEventTime").setAttribute("name", "saleEventTimeSeason");
  v.querySelector(".saleEventTime").closest(".form_element").querySelector(".form_label").innerHTML = "When do you want season passes to go on sale for your event?"
  
  v.prepend(sellpersonnum);
  v.prepend(sellnum);
  v.prepend(pricing);
  v.appendChild(endsale);
  v.querySelector(".venueV").closest('.form_element').remove();
  v.style = "border:0px solid #ccc; border-radius:0px 5px 5px 5px; padding:5px; margin-bottom:20px; background-color:#F5F5F5; display:inline-block; width:100%;";
  document.getElementById('number_of_children').appendChild(p);
  document.getElementById('number_of_children').appendChild(v);
}

function sendItemId(which = 'edit_item') { 
    //if i want to add this function to other places i just have to figure out how to get 'selected_item' out of it.
    if(which == 'parent'){
      var selected_item = document.getElementById('parent_id').value;
    }
    else if(which == 'child'){
      var selected_item = document.getElementById('child_events').value;
    }
    else{
      var selected_item = document.getElementById('itemNames').value; 
    }

    document.getElementById("item_id").value = selected_item;

    var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange=function() {
        if (xmlhttp.readyState==4 && xmlhttp.status==200) {
            var json = xmlhttp.responseText;
            var obj = JSON.parse(json);
            
            var item_name = obj['item_name'];
            var type_id = obj['type_id'];
            var org_id = obj['org_id'];
            var finance_id = obj['finance_id'];
            var display_home = obj['display_home'];
            var sellable = obj['sellable'];
            var store_open = obj['store_open'];
            var enable_promo = obj['enable_promo'];
            var total_item_count = obj['total_item_count'];
            var purchase_limit = obj['purchase_limit'];
            
            var begin_year = obj['begin_year'];
            var begin_month = obj['begin_month'];
            var begin_day = obj['begin_day'];
            var begin_time = obj['begin_time'];
            var end_year = obj['end_year'];
            var end_month = obj['end_month'];
            var end_day = obj['end_day'];
            var end_time = obj['end_time'];
            var sale_begin_year = obj['sale_begin_year'];
            var sale_begin_month = obj['sale_begin_month'];
            var sale_begin_day = obj['sale_begin_day'];
            var sale_begin_time = obj['sale_begin_time'];
            var sale_end_year = obj['sale_end_year'];
            var sale_end_month = obj['sale_end_month'];
            var sale_end_day = obj['sale_end_day'];
            var sale_end_time = obj['sale_end_time'];
            var sale_id = obj['sale_id'];
            var venue_id = obj['venue_id'];
            var seating = obj['seating'];

            var status = obj['status'];
            var description = obj['description'];
            var excerpt = obj['excerpt'];
            var thumbnail_filename = obj['thumbnail_filename'];
            var full_image_filename = obj['full_image_filename'];

            var item_prices = obj['item_prices'];

            console.log(obj);
            
            var num_item_prices = obj['item_prices'].length; //create that many new divs for displaying item_price data.

            var item_type = obj['item_type'];

            var show = document.querySelectorAll(".dropdown-content a");
            for(var i = 0; i < show.length; i++){
              if(show[i].classList.contains("hide")){
                show[i].classList.remove("hide");
              }
            }
            if (item_type == "Parent") {
                //remove items with class='parent_delete'
                var hide = document.getElementsByClassName("parent_delete");
                //$('.parent_delete').remove();
                changeStylesheetRule(document.styleSheets[4], '.dropdown-content.change', 'height', '132px');

                //add child items
                var select_child = "<option disabled selected>--select one--</option>";
                for(var id in obj['children']){
                  select_child += "<option value='" + id + "'>" + obj['children'][id] + "</option>";
                }
                document.getElementById('child_events').innerHTML = select_child;
            } else if (item_type == "Child") {
                //remove items with class='child_delete'
                var hide = document.getElementsByClassName("child_delete");
                //$('.child_delete').remove();
                changeStylesheetRule(document.styleSheets[4], '.dropdown-content.change', 'height', '176px');

                document.getElementById('parent_id').value = obj['parent_id'];
            } else if (item_type == "Single") {
                //remove items with class='single_delete'
                var hide = document.getElementsByClassName("single_delete");
                //$('.single_delete').remove();
                changeStylesheetRule(document.styleSheets[4], '.dropdown-content.change', 'height', '176px');
            }
            //hide whatever objects need to be hidden
            for(var i = 0; i < hide.length; i++){
              hide[i].classList.add("hide");
            }
            
            nextSlide(11);
            
            //main
            document.getElementById('event_name').value = item_name;
            document.getElementById('item_type').value = type_id;
            document.getElementById('item_org').value = org_id;
            document.getElementById('item_finance').value = finance_id;
            document.getElementById('display_home').value = display_home;
            document.getElementById('sellable').value = sellable;
            document.getElementById('store_open').value = store_open;
            document.getElementById('enable_promo').value = enable_promo;
            document.getElementById('total_item_count').value = total_item_count;
            document.getElementById('purchase_limit').value = purchase_limit;
            document.getElementById('sale_id').value = sale_id;

            //scheduling
            $("#startDateMonthEdit option[value="+begin_month+"]").attr('selected', true);
            $("#startDateDayEdit option[value="+begin_day+"]").attr('selected', true);
            $("#startDateYearEdit option[value="+begin_year+"]").attr('selected', true);
            $("#startEventTimeEdit option[value='"+begin_time+"']").attr('selected', true);

            $("#endDateMonthEdit option[value="+end_month+"]").attr('selected', true);
            $("#endDateDayEdit option[value="+end_day+"]").attr('selected', true);
            $("#endDateYearEdit option[value="+end_year+"]").attr('selected', true);
            $("#endEventTimeEdit option[value='"+end_time+"']").attr('selected', true);

            $("#saleDateMonthEdit option[value="+sale_begin_month+"]").attr('selected', true);
            $("#saleDateDayEdit option[value="+sale_begin_day+"]").attr('selected', true);
            $("#saleDateYearEdit option[value="+sale_begin_year+"]").attr('selected', true);
            $("#saleEventTimeEdit option[value='"+sale_begin_time+"']").attr('selected', true);

            $("#saleEndDateMonthEdit option[value="+sale_end_month+"]").attr('selected', true);
            $("#saleEndDateDayEdit option[value="+sale_end_day+"]").attr('selected', true);
            $("#saleEndDateYearEdit option[value="+sale_end_year+"]").attr('selected', true);
            $("#saleEndEventTimeEdit option[value='"+sale_end_time+"']").attr('selected', true);

            $("#venueTypeEdit option[value="+venue_id+"]").attr('selected', true);

            //pricing
            $("#numItemPrices option[value="+num_item_prices+"]").attr('selected', true);
            $("#numItemPrices").trigger("change");
            for (var i=1; i<=num_item_prices; i++) {
                document.getElementById("item_prices").querySelector("#itemPriceDiv"+i).querySelector(".ticketId").setAttribute("value", item_prices[i-1].id);
                document.getElementById("item_prices").querySelector("#itemPriceDiv"+i).querySelector(".ticketName").setAttribute("value", item_prices[i-1].label);
                document.getElementById("item_prices").querySelector("#itemPriceDiv"+i).querySelector(".ticketType").options[parseInt(item_prices[i-1].product_id)+1].setAttribute("selected", "selected");
                document.getElementById("item_prices").querySelector("#itemPriceDiv"+i).querySelector(".patronProfile").options[item_prices[i-1].patron_profile_id].setAttribute("selected", "selected");
                document.getElementById("item_prices").querySelector("#itemPriceDiv"+i).querySelector(".ticketPrice").setAttribute("value", item_prices[i-1].price);
                document.getElementById("item_prices").querySelector("#itemPriceDiv"+i).querySelector(".numTicketsOfType").setAttribute("value", item_prices[i-1].item_count);
                document.getElementById("item_prices").querySelector("#itemPriceDiv"+i).querySelector(".numTicketsPerPerson").setAttribute("value", item_prices[i-1].purchase_limit);
            }

            //advertising
            if (excerpt != null)
                document.getElementById("excerpt_edit").setAttribute("value", excerpt);
            $("#short_description_edit").html(description);

        }
    }
    xmlhttp.open('POST','/admin/handleItemRequest.php',true);
    xmlhttp.setRequestHeader('Content-type','application/x-www-form-urlencoded');
    xmlhttp.send("selected_item="+selected_item);
} 

function changeStylesheetRule(s, selector, property, value) {
    // Make the strings lowercase
    selector = selector.toLowerCase();
    property = property.toLowerCase();
    value = value.toLowerCase();

    // Change it if it exists
    for(var i = 0; i < s.cssRules.length; i++) {
        var rule = s.cssRules[i];
        if(rule.selectorText === selector) {
            rule.style[property] = value;
            return;
        }
    }

    // Add it if it does not
    s.insertRule(selector + " { " + property + ": " + value + "; }", 0);
}

function GetElementInsideContainer(containerID, childID) {
    var elm = document.getElementById(childID);
    var parent = elm ? elm.parentNode : {};
    return (parent.id && parent.id === containerID) ? elm : {};
}

function updateItemPrices() {
  var numItemPrices = document.getElementById('numItemPrices').value;
  if (isNaN(numItemPrices))
    numItemPrices = 0;
  var height_of_div = 435 + 30+16;
  document.getElementById('item_prices').style.maxHeight = (numItemPrices * height_of_div) + "px"; //116 //also i could make visibility:hidden for items that are not showing.
}

function createItemPriceOptions(numItemPrices) {
  for (var i = 1; i <= numItemPrices; i++) {
    var p = document.createElement('p');
    p.setAttribute("id", "itemPriceText"+i);
    var t = document.createTextNode("Ticket Number " + i);
    p.style.fontSize = "15px";
    p.style = "border-top-left-radius:5px; border-top-right-radius:5px; background-color:#428bca; color:white; padding:5px; margin-bottom:-3px; width:125px; text-align:center;"; /* #428bca #F5F5F5 */
    p.appendChild(t);
    var v = document.createElement('div');
    v.setAttribute("id", "itemPriceDiv"+i);
    v.innerHTML = document.getElementById('typeofticket').innerHTML;
    v.querySelector(".ticketId").setAttribute("name", "ticketId"+i);
    v.querySelector(".ticketName").setAttribute("name", "ticketNameEdit"+i);
    v.querySelector(".ticketType").setAttribute("name", "ticketTypeEdit"+i); 
    v.querySelector(".patronProfile").setAttribute("name", "patronProfileEdit"+i);
    v.querySelector(".ticketPrice").setAttribute("name", "ticketPriceEdit"+i);
    v.querySelector(".numTicketsOfType").setAttribute("name", "numTicketsOfTypeEdit"+i);
    v.querySelector(".numTicketsPerPerson").setAttribute("name", "numTicketsPerPerson"+i);
    v.style = "border:0px solid #ccc; border-radius:0px 5px 5px 5px; padding:5px; margin-bottom:20px; background-color:#F5F5F5; display:inline-block; width:100%;";
    document.getElementById('item_prices').appendChild(p);
    document.getElementById('item_prices').appendChild(v);
  }
}

function differentPrices(){
    if(document.getElementById('yesPrices').checked){
        document.getElementById('priceOptions').style.display = 'block';
    }else if(document.getElementById('noPrices').checked){
        document.getElementById('priceOptions').style.display = 'none';
    }
}

function promoCoder(){
    if(document.getElementById('promoCodesYes').checked){
        document.getElementById('codesHere').style.display = 'block';
    } else if(document.getElementById('promoCodesNo').checked){
        document.getElementById('codesHere').style.display = 'none';
    }
}

function ticketLimit(){
    if (document.getElementById('yesCheck').checked) {
        document.getElementById('totalYes').style.display = 'block';
    } else document.getElementById('totalYes').style.display = 'none';
}

function ticketTotal(){
    if (document.getElementById('yesCheck2').checked) {
        document.getElementById('totalYes2').style.display = 'block';
    } else document.getElementById('totalYes2').style.display = 'none';
}


function notApplicable1(){
    if (document.getElementById('BYUadmission').checked) {
        document.getElementById('BYUstudent').style.display = 'none';
        document.getElementById('showUp').checked = false;
        document.getElementById('showUp').style.display = 'block';

    } else{
        document.getElementById('BYUstudent').style.display = 'block';
        document.getElementById('showUp').style.display = 'none';
        document.getElementById('include').checked = false;
    }
}

function nowApplicable1(){
    if(document.getElementById('showUp').checked){
        document.getElementById('BYUstudent').style.display = 'block';
        document.getElementById('showUp').style.display = 'none';
    } else{
        document.getElementById('showUp').style.display = 'none';
        document.getElementById('BYUstudent').style.display = 'block';
        document.getElementById('BYUadmission').checked = false;
    }
}

document.getElementById('venueType2').onchange = function(){
    if (this.value == 'New') {
        document.getElementById('VenueName').style.display = 'block';
        document.getElementById('VenueAddress').style.display = 'block';
    } else {
        document.getElementById('VenueName').style.display = 'none';
        document.getElementById('VenueAddress').style.display = 'none';
    }
}

function beginSell(){
    if(document.getElementById('sellableNo').checked){
        document.getElementById('beginDate').style.display = 'block';
    }else document.getElementById('beginDate').style.display = 'none';
}

document.getElementById('itemType2').onchange = function(){
    if (this.value == 'fee' || this.value == 'payment' || this.value == 'product') {
        document.getElementById('venueType').style.display = 'none';
        document.getElementById('venueType').value = 0;
    } else {
        document.getElementById('venueType').style.display = 'block';
    }
};