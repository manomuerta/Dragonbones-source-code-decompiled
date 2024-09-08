package _906
{
   import _1045.Group;
   import _1045.Label;
   import _11111._11110;
   import _11260.EventFolderItem;
   import _11260._11259;
   import _11260._11262;
   import _1177.IndexChangeEvent;
   import _1185._1197;
   import _13492._13491;
   import _13503._13502;
   import _1374.IconButton;
   import _1404._1407;
   import _40._44;
   import _470._11495;
   import _472._475;
   import _636.AnimationEvent;
   import _668._672;
   import _73._75;
   import _783.CommandNotification;
   import _834._833;
   import _97._125;
   import egret.utils.tr;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.MouseEvent;
   
   public class MainFrameProgertyGroup extends Group
   {
      public var _11441:Label;
      
      public var _11340:Group;
      
      public var _11342:_11262;
      
      public var _11472:_11259;
      
      public var _11471:IconButton;
      
      public var _11470:IconButton;
      
      public var _11469:IconButton;
      
      private var _4761:_672;
      
      private var _4044:PropertyPanel;
      
      private var _4109:_13491;
      
      public function MainFrameProgertyGroup()
      {
         this._11441 = new Label();
         this._11340 = _125._2404();
         this._11342 = new _11262();
         this._11472 = new _11259();
         this._11471 = new IconButton();
         this._11470 = new IconButton();
         this._11469 = new IconButton();
         super();
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this._11441.percentWidth = 100;
         this._11441.text = tr("Property.frame.event");
         this._11340.percentWidth = 100;
         this._11342.percentWidth = 100;
         this._11472.percentWidth = 100;
         this._11472._11454._5987 = "name";
         this._11471.percentWidth = 100;
         this._11471.height = _125._2411;
         this._11471.skinName = _833;
         this._11471.icon = "/assets/comic/addPlus.png";
         this._11471.label = tr("Property.frame.event.addEvent");
         this._11470.percentWidth = 100;
         this._11470.height = _125._2411;
         this._11470.skinName = _833;
         this._11470.icon = "/assets/comic/addPlus.png";
         this._11470.label = tr("Property.frame.event.addSound");
         this._11469.percentWidth = 100;
         this._11469.height = _125._2411;
         this._11469.skinName = _833;
         this._11469.icon = "/assets/comic/addPlus.png";
         this._11469.label = tr("Property.frame.event.addAnimation");
         var _loc1_:_1197 = new _1197();
         _loc1_.gap = 9;
         this.top = 4;
         this.layout = _loc1_;
         this.percentWidth = 100;
         this.addElement(this._11441);
         this.addElement(this._11340);
         this.addElement(this._11471);
         this.addElement(this._11342);
         this.addElement(this._11470);
         this.addElement(this._11472);
         this.addElement(this._11469);
         this._11342.removeBtn.addEventListener(MouseEvent.CLICK,this._11456);
         this._11342._11343.addEventListener(FocusEvent.FOCUS_OUT,this._11455);
         this._11472.removeBtn.addEventListener(MouseEvent.CLICK,this._11456);
         this._11472._11454.addEventListener(IndexChangeEvent.CHANGE,this._11455);
         this._11471.addEventListener(MouseEvent.CLICK,this._11456);
         this._11470.addEventListener(MouseEvent.CLICK,this._11456);
         this._11469.addEventListener(MouseEvent.CLICK,this._11456);
      }
      
      private function _11456(param1:Event) : void
      {
         var _loc2_:_13491 = null;
         var _loc3_:Array = null;
         var _loc4_:_44 = null;
         if(this._4761._13803 == null)
         {
            _loc2_ = new _13491();
            _loc3_ = [];
            _loc2_.value = _loc3_;
            switch(param1.currentTarget)
            {
               case this._11471:
                  _loc4_ = _44.create(_75.DISPATCH_EVENT,"eventName");
                  _loc3_.push(_loc4_);
                  this._4044.dispatchEvent(new AnimationEvent(AnimationEvent.ADD_EVENT_FRAME,_loc2_,true));
                  break;
               case this._11470:
                  _loc4_ = _44.create(_75.SOUND,"soundName");
                  _loc3_.push(_loc4_);
                  this._4044.dispatchEvent(new AnimationEvent(AnimationEvent.ADD_EVENT_FRAME,_loc2_,true));
                  break;
               case this._11469:
                  _loc4_ = _44.create(_75.GOTO_AND_PLAY,this._4761._1886.defaultAnimation);
                  _loc3_.push(_loc4_);
                  this._4044.dispatchEvent(new AnimationEvent(AnimationEvent.ADD_EVENT_FRAME,_loc2_,true));
            }
         }
         else
         {
            switch(param1.currentTarget)
            {
               case this._11471:
                  this._4044.dispatchEvent(new AnimationEvent(AnimationEvent.ADD_FRAME_ACTION,[this._4761._13803,_75.DISPATCH_EVENT,"eventName"]));
                  break;
               case this._11470:
                  this._4044.dispatchEvent(new AnimationEvent(AnimationEvent.ADD_FRAME_ACTION,[this._4761._13803,_75.SOUND,"soundName"]));
                  break;
               case this._11469:
                  this._4044.dispatchEvent(new AnimationEvent(AnimationEvent.ADD_FRAME_ACTION,[this._4761._13803,_75.GOTO_AND_PLAY,this._4761._1886.defaultAnimation]));
                  break;
               case this._11342.removeBtn:
                  this._4044.dispatchEvent(new AnimationEvent(AnimationEvent.DEL_FRAME_ACTION,[this._4761._13803,this._11342.vo]));
                  this._4044.stage.focus = this.stage;
                  break;
               case this._11472.removeBtn:
                  this._4044.dispatchEvent(new AnimationEvent(AnimationEvent.DEL_FRAME_ACTION,[this._4761._13803,this._11472.vo]));
                  this._4044.stage.focus = this.stage;
            }
         }
      }
      
      private function _11455(param1:Event) : void
      {
         var _loc2_:_13502 = null;
         var _loc3_:String = null;
         if(this._11342 == null || this._11342._11343 == null || this._11472 == null || this._11472._11454 == null)
         {
            return;
         }
         switch(param1.currentTarget)
         {
            case this._11342._11343:
               if(this._11342._11343.text == "\x19")
               {
                  return;
               }
               if(Boolean(this._11342.vo) && this._11342.vo.value != this._11342._11343.text)
               {
                  _11495._11570(CommandNotification.MODIFY_FRAME_ACTION,_11495.create(this._11342.vo).add("value",this._11342._11343.text));
               }
               break;
            case this._11472._11454:
               if(this._4761 && this._4761._1886 && Boolean(this._4761._1886._13619))
               {
                  _loc2_ = this._4761._1886._13619[this._11472._11454.selectedIndex];
               }
               _loc3_ = !!_loc2_ ? _loc2_.name : null;
               if(Boolean(this._11472.vo) && this._11472.vo.value != _loc3_)
               {
                  _11495._11570(CommandNotification.MODIFY_FRAME_ACTION,_11495.create(this._11472.vo).add("value",_loc3_));
               }
         }
      }
      
      private function _11462(param1:Boolean) : void
      {
         var _loc2_:_44 = null;
         var _loc3_:int = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:EventFolderItem = null;
         var _loc7_:_13502 = null;
         if(param1)
         {
            this._11342.vo = null;
            this._11472.vo = null;
            for each(_loc2_ in this._4109._13637)
            {
               switch(_loc2_._1622)
               {
                  case _75.DISPATCH_EVENT:
                     _loc4_ = 0;
                     _loc5_ = uint(this._11340._2249);
                     while(_loc4_ < _loc5_)
                     {
                        _loc6_ = this._11340.getElementAt(_loc4_) as EventFolderItem;
                        if(_loc6_.vo == _loc2_)
                        {
                           break;
                        }
                        _loc6_ = null;
                        _loc4_++;
                     }
                     if(!_loc6_)
                     {
                        (_loc6_ = new EventFolderItem()).percentWidth = 100;
                     }
                     this._11340.addElement(_loc6_);
                     _loc6_.refresh(_loc2_);
                     break;
                  case _75.SOUND:
                     this._11342.vo = _loc2_;
                     break;
                  case _75.GOTO_AND_PLAY:
                     this._11472.vo = _loc2_;
                     break;
               }
            }
            _loc3_ = this._11340._2249;
            while(_loc3_--)
            {
               _loc6_ = this._11340.getElementAt(_loc3_) as EventFolderItem;
               if(this._4109._13637.indexOf(_loc6_.vo) < 0)
               {
                  this._11340.removeElement(_loc6_);
               }
            }
            if(this._11342.vo)
            {
               this._11342.visible = true;
               this._11342._2526["image"].visible = false;
               this._11342._11343.text = this._11342.vo.value;
               this._11470.visible = false;
            }
            else
            {
               this._11342.visible = false;
               this._11470.visible = true;
            }
            if(this._11472.vo)
            {
               this._11472.visible = true;
               this._11472._2526["image"].visible = false;
               this._11469.visible = false;
               this._11472.animations.source = this._4761._1886._13619;
               _loc7_ = this._4761._1886._13656(this._11472.vo.value);
               if(_loc7_)
               {
                  this._11472._11454.selectedIndex = this._4761._1886._13619.indexOf(_loc7_);
               }
               else
               {
                  this._11472.visible = false;
                  this._11469.visible = true;
                  _loc3_ = int(this._4109._13637.indexOf(this._11472.vo));
                  if(_loc3_)
                  {
                     this._4109._13637.splice(_loc3_,1);
                     this._11472.vo = null;
                  }
               }
            }
            else
            {
               this._11472.visible = false;
               this._11469.visible = true;
            }
         }
         else
         {
            this._11342.visible = false;
            this._11472.visible = false;
            this._11469.visible = false;
            this._11470.visible = false;
         }
         this._11342.includeInLayout = this._11342.visible;
         this._11470.includeInLayout = this._11470.visible;
         this._11472.includeInLayout = this._11472.visible;
         this._11469.includeInLayout = this._11469.visible;
      }
      
      public function refresh() : void
      {
         try
         {
            if(!this._4044)
            {
               this._4044 = _1407.getInstance(PropertyPanel) as PropertyPanel;
            }
            if(!this._4761)
            {
               this._4761 = this._4044.model;
            }
            if(this._4761)
            {
               if(this._4761._13803)
               {
                  if(this._4761._13803.value == null)
                  {
                     this._4761._13803.value = [];
                  }
                  this._4109 = this._4761._13803;
               }
               else
               {
                  this._4109 = new _13491();
                  this._4109.value = [];
               }
               this._11462(true);
            }
            else
            {
               this._4109 = null;
               this._11462(false);
            }
         }
         catch(error:*)
         {
            _11110.instance._11204._11132("MainFrameProgertyGroup::refresh",error);
            _475._2377(error);
         }
      }
   }
}

