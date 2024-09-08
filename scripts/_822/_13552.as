package _822
{
   import _1038._1042;
   import _1045.Group;
   import _1045.Label;
   import _1177.IndexChangeEvent;
   import _1185._1196;
   import _127._163;
   import _1374.TextInput;
   import _1404._1407;
   import _51._70;
   import _521._532;
   import _579._580;
   import _703._702;
   import _703._704;
   import _872._13553;
   import _931._933;
   import egret.utils.StringUtil;
   import egret.utils._99;
   import egret.utils.tr;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.KeyboardEvent;
   import flash.events.TimerEvent;
   import flash.ui.Keyboard;
   import flash.utils.Dictionary;
   import flash.utils.Timer;
   
   public class _13552 extends Group
   {
      public var _4536:TextInput;
      
      private var _6668:Label;
      
      private var _4464:_702;
      
      public var _4499:_702;
      
      public var _4461:Array;
      
      public var _13791:_702;
      
      private var panel:_13553;
      
      private var _6036:_163;
      
      private var _4533:Boolean;
      
      private var _4504:String;
      
      public var _13956:Function;
      
      private var _13958:Boolean = false;
      
      private var _4491:Timer;
      
      public function _13552(param1:_163, param2:_13553)
      {
         this._4461 = [];
         this._4491 = new Timer(1500,1);
         super();
         this.tree = param1;
         this.panel = param2;
         this._13791 = this.panel._13955();
      }
      
      public function get tree() : _163
      {
         return this._6036;
      }
      
      public function set tree(param1:_163) : void
      {
         this._6036 = param1;
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this._4536 = new TextInput();
         this._4536.skinName = _933;
         this._4536.prompt = tr("Scene.Tree.Prompt");
         this._4536.percentWidth = 100;
         this._4536.height = 22;
         this._4536.left = 0;
         this._4536.top = 0;
         this.addElement(this._4536);
         this._6668 = new Label();
         this._6668.text = tr("Scene.Tree.SearchEmpty.ToolTip");
         this._6668.left = 1;
         this._6668.right = 4;
         this._6668.verticalAlign = _1196.MIDDLE;
         this._6668.height = 22;
         this._6668._6080 = 1;
         this._6668.mouseEnabled = false;
         this._6668.mouseChildren = false;
         this.addElement(this._6668);
         this._4466();
         this._1576();
      }
      
      public function get _4511() : String
      {
         return this._4504;
      }
      
      public function set _4511(param1:String) : void
      {
         this._4504 = param1;
         if(StringUtil.trim(param1).length > 0)
         {
            this._4533 = true;
         }
         else
         {
            this._4533 = false;
         }
         this._4465();
      }
      
      public function _4460() : void
      {
         this._6668.visible = true;
         this._6668.includeInLayout = true;
      }
      
      public function _4466() : void
      {
         this._6668.visible = false;
         this._6668.includeInLayout = false;
      }
      
      private function _1576() : void
      {
         this._4536.addEventListener(Event.CHANGE,this._4497,false);
         this._4536.addEventListener("textChanged",this._4482,true);
         this._4536.addEventListener("clearInput",this._4489,false);
         this._4536.addEventListener(KeyboardEvent.KEY_UP,this.onKeyUp,true);
         this._4536.addEventListener(FocusEvent.FOCUS_IN,function(param1:FocusEvent):void
         {
            _4466();
         });
      }
      
      private function _4497(param1:Event) : void
      {
         if(this.tree.dataProvider is _1042)
         {
            this._4511 = this._4536.text;
         }
      }
      
      private function _4482(param1:Event) : void
      {
         var _loc2_:_933 = this._4536.skin as _933;
         if(_loc2_)
         {
            _loc2_._4527(param1.target.text.length > 0);
         }
      }
      
      private function _4489(param1:Event) : void
      {
         this._4536.text = "";
         this._4511 = "";
      }
      
      public function _14549() : void
      {
         if(this._4511 != "" && this._4511 != null)
         {
            this._4536.text = "";
            this._4511 = "";
         }
      }
      
      private function onKeyUp(param1:KeyboardEvent) : void
      {
         var _loc2_:_1042 = null;
         var _loc3_:_702 = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:Vector.<Object> = null;
         var _loc7_:_532 = null;
         if(!this._4533)
         {
            return;
         }
         if(param1.keyCode == Keyboard.UP || param1.keyCode == Keyboard.DOWN)
         {
            if(Boolean(this._4499) && this.tree.dataProvider is _1042)
            {
               _loc2_ = this.tree.dataProvider as _1042;
               _loc4_ = _loc2_.getItemIndex(this._4499);
               if(_loc4_ >= 0)
               {
                  _loc5_ = -1;
                  if(param1.keyCode == Keyboard.UP)
                  {
                     if(_loc4_ - 1 < 0)
                     {
                        _loc5_ = _loc4_;
                     }
                     else
                     {
                        _loc5_ = _loc4_ - 1;
                     }
                  }
                  else if(param1.keyCode == Keyboard.DOWN)
                  {
                     if(_loc4_ > _loc2_.length)
                     {
                        _loc5_ = _loc4_;
                     }
                     else
                     {
                        _loc5_ = _loc4_ + 1;
                     }
                  }
                  if(_loc5_ >= 0)
                  {
                     _loc3_ = _loc2_.getItemAt(_loc5_) as _702;
                     if(_loc3_)
                     {
                        _loc6_ = new Vector.<Object>();
                        _loc6_.push(_loc3_);
                        this._4127(_loc6_);
                        (_loc7_ = _1407.getInstance(_532) as _532)._2484 = _loc3_.vo;
                        this._4499 = _loc3_;
                        this._4449(_loc3_);
                     }
                  }
               }
            }
         }
      }
      
      public function _4127(param1:Vector.<Object>) : void
      {
         var _loc2_:Object = null;
         for each(_loc2_ in param1)
         {
            this.tree._4550(_loc2_);
         }
         this.tree._2889 = param1;
      }
      
      private function _4449(param1:_702) : void
      {
         if(param1)
         {
            this._4536._2577.text = param1.vo.name;
            this._4536.selectAll();
         }
      }
      
      public function _4471(param1:_702) : void
      {
         var _4467:_702 = param1;
         var refreshVisible:Function = function(param1:_702):void
         {
            var _loc2_:_702 = null;
            if(!(!param1 is _704))
            {
               (param1 as _704).visible = true;
            }
            if(param1.children.length)
            {
               for each(_loc2_ in param1.children)
               {
                  refreshVisible(_loc2_);
               }
            }
         };
         refreshVisible(_4467);
      }
      
      public function _4481() : void
      {
         this._4499 = null;
         this._13791 = this.panel._13955();
         this._4456();
         if(this._4499)
         {
            _99(function():void
            {
               var _loc2_:_702 = null;
               if(_4461.length)
               {
                  for each(_loc2_ in _4461)
                  {
                     _4501(_loc2_,true);
                  }
               }
               var _loc1_:Vector.<Object> = new Vector.<Object>();
               _loc1_.push(_4499);
               _4127(_loc1_);
            },null,1);
         }
      }
      
      private function _4456() : _702
      {
         var _loc1_:_702 = null;
         var _loc3_:* = undefined;
         var _loc2_:Dictionary = new Dictionary();
         if(this._13956 != null)
         {
            this._13956(_loc2_);
         }
         else
         {
            this._4483(_loc2_);
         }
         for(_loc3_ in _loc2_)
         {
            this._4488(_loc3_,_loc2_);
         }
         this._4463(this._13791,_loc2_);
         return this._13791;
      }
      
      private function _4483(param1:Dictionary) : void
      {
         var fullMatch:Boolean = false;
         var tempsearchContent:String = null;
         var filterNodes:Dictionary = param1;
         var getChildren:Function = function(param1:_702):void
         {
            var _loc2_:String = null;
            var _loc3_:int = 0;
            var _loc4_:_702 = null;
            if(Boolean(param1.vo) && Boolean(param1.vo.name))
            {
               _loc2_ = param1.vo is _70 ? (param1.vo as _70)._13228 : param1.vo.name;
               _loc3_ = int(StringUtil.trim(_loc2_).toLocaleLowerCase().indexOf(tempsearchContent));
               if(_loc3_ >= 0)
               {
                  filterNodes[param1] = true;
                  _4461.push(param1);
                  if(!fullMatch)
                  {
                     _4499 = param1;
                  }
                  fullMatch = true;
               }
            }
            if(param1.children.length)
            {
               for each(_loc4_ in param1.children)
               {
                  getChildren(_loc4_);
               }
            }
         };
         tempsearchContent = this._4511.toLocaleLowerCase();
         if(this._13791)
         {
            getChildren(this._13791);
         }
      }
      
      private function _4488(param1:_702, param2:Dictionary) : void
      {
         var _loc3_:_702 = param1.parent;
         if(_loc3_)
         {
            param2[_loc3_] = true;
            this._4488(_loc3_,param2);
         }
      }
      
      private function _4463(param1:_702, param2:Dictionary) : void
      {
         var _2879:_702 = param1;
         var filterNodes:Dictionary = param2;
         var remove:Function = function(param1:_702):void
         {
            var _loc2_:_702 = null;
            if(Boolean(param1.vo) && !(param1 in filterNodes))
            {
               if(param1 is _704 && Boolean(param1.parent))
               {
                  (param1 as _704).visible = false;
               }
            }
            if(param1.children.length)
            {
               for each(_loc2_ in param1.children)
               {
                  remove(_loc2_);
               }
            }
         };
         if(!_2879)
         {
            return;
         }
         remove(_2879);
      }
      
      public function _4501(param1:Object, param2:Boolean) : void
      {
         var _loc3_:_1042 = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(param1 == null || param1.children <= 0)
         {
            return;
         }
         if(Boolean(this.tree) && Boolean(this.tree.dataProvider))
         {
            _loc3_ = this.tree.dataProvider as _1042;
         }
         if(_loc3_)
         {
            _loc3_._4529(param1,param2);
            if(Boolean(param1.children) && param1.children.length > 0)
            {
               _loc4_ = 0;
               _loc5_ = int(param1.children.length);
               while(_loc4_ < _loc5_)
               {
                  this._4501(param1.children[_loc4_],param2);
                  _loc4_++;
               }
            }
         }
      }
      
      public function _4537() : void
      {
         var _loc1_:_702 = this.panel._13955();
         if(_loc1_)
         {
            this._4501(_loc1_,false);
         }
      }
      
      public function get _3176() : _580
      {
         return _1407.getInstance(_580) as _580;
      }
      
      public function _4516() : void
      {
         var _2226:_532;
         var vector:Vector.<Object> = null;
         _99(function():void
         {
            _4127(vector);
            if(_13954)
            {
               _13957();
            }
         },null,0);
         vector = new Vector.<Object>();
         _2226 = _1407.getInstance(_532) as _532;
         if(this._4499)
         {
            this._4464 = this._4499;
            vector.push(this._4499);
         }
         else if(Boolean(this._4464) && !this._4499)
         {
            vector.push(this._4464);
         }
         if(!this._4499)
         {
            this._4468();
         }
      }
      
      public function get _13954() : Boolean
      {
         return this._13958;
      }
      
      public function set _13954(param1:Boolean) : void
      {
         this._13958 = param1;
      }
      
      private function _13957() : void
      {
         this.dispatchEvent(new IndexChangeEvent(IndexChangeEvent.CHANGE,true));
      }
      
      private function _4468() : void
      {
         this._4491.stop();
         this._4536.prompt = "";
         this._4460();
         if(!this._4491.hasEventListener(TimerEvent.TIMER))
         {
            this._4491.addEventListener(TimerEvent.TIMER,function():void
            {
               _4466();
               _4536.prompt = tr("Scene.Tree.Prompt");
            });
         }
         this._4491.start();
      }
      
      public function _3514() : void
      {
         this._4536.text = "";
         this._4511 = "";
         this._4533 = false;
         this._4499 = null;
         this._4464 = null;
         this._4461 = [];
      }
      
      public function _4465() : void
      {
         this.panel._4465();
      }
   }
}

