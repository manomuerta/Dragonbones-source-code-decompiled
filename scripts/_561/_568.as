package _561
{
   import _1177.CloseEvent;
   import _1177.UIEvent;
   import _127._133;
   import _13._12;
   import _13._14;
   import _1374.Alert;
   import _1404._1407;
   import _24.Shortcut;
   import _24._26;
   import _51._70;
   import _51._79;
   import _586._594;
   import _636.DBModelEvent;
   import _636.MeshEvent;
   import _658.Mesh;
   import _658._659;
   import _658._661;
   import _703._705;
   import _708._715;
   import _73._74;
   import _783.CommandNotification;
   import _783.StageNotification;
   import _877.MeshPanel;
   import _877._876;
   import _877._878;
   import _93._94;
   import _97._116;
   import egret.utils.tr;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class _568 extends _94
   {
      public static const TOOL_NONE:int = -1;
      
      public static const TOOL_MODIFY_VERTEX:int = 0;
      
      public static const TOOL_ADD_VERTEX:int = 1;
      
      public static const TOOL_DEL:int = 2;
      
      public static const TOOL_OUTLINE:int = 3;
      
      public static const TOOL_ADD_EDGE:int = 9;
      
      public static const TOOL_DEFAULT:int = 0;
      
      private var _4301:_563;
      
      private var _4303:_560;
      
      private var _4297:_569;
      
      private var _4304:_564;
      
      private var _4299:_562;
      
      private var _4308:_565;
      
      private var _4327:MeshPanel;
      
      private var _4322:_878;
      
      private var _4211:_876;
      
      private var _4210:_659;
      
      private var _4296:_70;
      
      private var _2123:Mesh;
      
      private var _4331:int = -1;
      
      private var _4328:_79;
      
      private var _4220:Boolean;
      
      private var _4309:String;
      
      private var _4332:Boolean;
      
      private var _4318:Boolean;
      
      private var _4310:Boolean;
      
      public function _568()
      {
         super();
      }
      
      public function stop() : void
      {
         this.dispose();
      }
      
      override protected function _1576() : void
      {
         _1565(StageNotification.OPEN_MESH_EDITOR,this._4300);
         _1565(StageNotification.CLOSE_MESH_EDITOR,this._4298);
         _1565(StageNotification.UPDATE_SELECTED_ITEMS,this._4023);
         _1565(StageNotification.UPDATE_LIBRARY,this._4307);
         _1565(StageNotification.UPDATE_EDIT_MODE,this._3864);
      }
      
      private function _3864(param1:StageNotification) : void
      {
         if(_2220._2873 == _715.ANIMATE || _2220._2873 == _715.GENERAL)
         {
            this._1838 = null;
         }
         else
         {
            this._1838 = null;
            this._4023(null);
         }
      }
      
      private function _4307(param1:StageNotification) : void
      {
         if(this._4211)
         {
            this._4211._4312();
         }
      }
      
      private function _4023(param1:Event) : void
      {
         if(_2226._2889.length == 1)
         {
            if(_2226._2484 is _79 && (_2226._2484 as _79)._2049 && (_2226._2484 as _79)._2049.type == _74.MESH)
            {
               this._1838 = (_2226._2484 as _79)._2049 as _70;
            }
            else if(_2226._2484 is _70 && (_2226._2484 as _70).type == _74.MESH)
            {
               this._1838 = _2226._2484 as _70;
            }
            else
            {
               this._1838 = null;
            }
         }
         else
         {
            this._1838 = null;
         }
      }
      
      private function _4298(param1:Event) : void
      {
         _1567(new CommandNotification(CommandNotification.CLOSE_PANEL,_116.MESH_PANEL));
      }
      
      private function _4300(param1:Event) : void
      {
         if(Boolean(this._4211) && Boolean(this._4211.stage))
         {
            return;
         }
         _1567(new CommandNotification(CommandNotification.OPEN_PANEL,_116.MESH_PANEL));
      }
      
      override protected function init() : void
      {
         super.init();
         this._4327 = _1407.getInstance(MeshPanel);
         this._4269 = this._4327._4269;
         this._4301 = _1407.getInstance(_563) as _563;
         this._4303 = _1407.getInstance(_560) as _560;
         this._4297 = _1407.getInstance(_569) as _569;
         this._4304 = _1407.getInstance(_564) as _564;
         this._4299 = _1407.getInstance(_562) as _562;
         this._4322 = this._4327._4325;
         if(this._4322 != null)
         {
            this._4322.enabled = false;
            this._4322.addEventListener(Event.CHANGE,this._4320);
            if(this._4210)
            {
               this._4322.enabled = true;
               this._4335 = TOOL_DEFAULT;
            }
         }
         else
         {
            this._4327.addEventListener(UIEvent.UPDATE_COMPLETE,this._4321);
         }
         this._4327.addEventListener(MeshEvent.SCALE,this._4316);
         this._4327.addEventListener(MouseEvent.ROLL_OVER,this._4233);
         this._4327.addEventListener(MouseEvent.ROLL_OUT,this._4237);
         this._4327.addEventListener(MeshEvent.PANEL_MOVING,this._4317);
         this._4327.addEventListener(MeshEvent.RESET,this._4334);
         this._4327.addEventListener(Event.ADDED_TO_STAGE,this._4333);
         this._4327.addEventListener(Event.REMOVED_FROM_STAGE,this._4330);
         if(this._4322)
         {
            this._4322.addEventListener(MouseEvent.ROLL_OVER,this._4237);
            this._4322.addEventListener(MouseEvent.ROLL_OUT,this._4233);
         }
      }
      
      private function _4233(param1:MouseEvent) : void
      {
         _14.setCursor(this._4309);
         if(this._4308)
         {
            this._4308._4240 = false;
         }
         this._4310 = false;
      }
      
      private function _4237(param1:MouseEvent) : void
      {
         _14.setCursor(_12.AUTO);
         if(this._4308)
         {
            this._4308._4240 = true;
         }
         this._4310 = true;
      }
      
      private function _4333(param1:Event) : void
      {
         if(_2226._2889.length == 1)
         {
            if(_2226._2484 is _70)
            {
               this._1838 = _2226._2484 as _70;
            }
            else if(_2226._2484 is _79)
            {
               if((_2226._2484 as _79)._2049)
               {
                  this._1838 = (_2226._2484 as _79)._2049;
               }
            }
         }
         if(!this._4318)
         {
            this._4305();
         }
      }
      
      private function _4330(param1:Event) : void
      {
         this._4335 = TOOL_NONE;
         this._4302();
      }
      
      private function _4305() : void
      {
         if(Boolean(this._4211) && Boolean(this._4211.stage))
         {
            Shortcut._1681(this._4211.stage,_26.MESH_EDIT,this._4311);
            Shortcut._1681(this._4211.stage,_26.MESH_ADD,this._4315);
            Shortcut._1681(this._4211.stage,_26.MESH_DELETE,this._4306);
            this._4318 = true;
         }
      }
      
      private function _4302() : void
      {
         Shortcut._1673(this._4211.stage,_26.MESH_EDIT,this._4311);
         Shortcut._1673(this._4211.stage,_26.MESH_ADD,this._4315);
         Shortcut._1673(this._4211.stage,_26.MESH_DELETE,this._4306);
         this._4318 = false;
      }
      
      private function _4334(param1:MeshEvent) : void
      {
         var onCloseBtnClick:Function = null;
         var checkFunction:Function = null;
         var e:MeshEvent = param1;
         onCloseBtnClick = function(param1:CloseEvent):void
         {
            if(param1.detail == Alert.FIRST_BUTTON)
            {
               _4329();
            }
         };
         checkFunction = function(param1:DBModelEvent):void
         {
            _2216.deleteConfirm = !param1.data;
         };
         _133.show(tr("ResetMesh.content"),tr("ResetMesh.title"),null,onCloseBtnClick,tr("Alert.Confirm"),tr("Alert.Cancel"),"",_2216.deleteConfirm,checkFunction);
      }
      
      private function _4329() : void
      {
         if(this._4331 == TOOL_OUTLINE)
         {
            this._3187();
         }
         if(this._4328 && this._2123 && !this._2123._4326())
         {
            _1567(new CommandNotification(CommandNotification.RESET_ORIGIN,{
               "_1837":this._4328,
               "mesh":this._2123
            }));
         }
      }
      
      private function _4317(param1:MeshEvent) : void
      {
         this._4220 = Boolean(param1.data);
         if(this._4308)
         {
            this._4308._4230 = this._4220;
         }
         if(this._4220)
         {
            _14.setCursor(_12.CURSOR_DRAG_HAND_FORTOOL);
         }
         else
         {
            _14.setCursor(this._4309);
         }
      }
      
      private function _4316(param1:MeshEvent) : void
      {
         this._4210.scale = Number(param1.data);
         if(this._4308)
         {
            this._4308.scale = Number(param1.data);
         }
      }
      
      private function _4321(param1:UIEvent) : void
      {
         this._4327.removeEventListener(UIEvent.UPDATE_COMPLETE,this._4321);
         this._4269 = this._4327._4269;
         this._4322 = this._4327._4325;
         this._4322.addEventListener(Event.CHANGE,this._4320);
         this._4322.addEventListener(MouseEvent.ROLL_OVER,this._4237);
         this._4322.addEventListener(MouseEvent.ROLL_OUT,this._4233);
         if(_2226._2889.length == 1)
         {
            if(_2226._2484 is _70)
            {
               this._1838 = _2226._2484 as _70;
            }
            else if(_2226._2484 is _79)
            {
               this._1838 = (_2226._2484 as _79)._2049;
            }
         }
         if(this._4296)
         {
            this._4322.enabled = true;
            if(this._4331 < 0)
            {
               this._4322._4335 = TOOL_DEFAULT;
               this._4335 = TOOL_DEFAULT;
            }
         }
         else
         {
            this._4322._4335 = TOOL_NONE;
            this._4335 = TOOL_NONE;
            this._4322.enabled = false;
         }
      }
      
      private function _4320(param1:Event) : void
      {
         var onCloseBtnClick:Function;
         var checkFunction:Function;
         var e:Event = param1;
         if(this._4322._4335 == TOOL_OUTLINE)
         {
            onCloseBtnClick = function(param1:CloseEvent):void
            {
               if(param1.detail == Alert.FIRST_BUTTON)
               {
                  _4335 = _4322._4335;
               }
               else
               {
                  _4319(_4331);
               }
            };
            checkFunction = function(param1:DBModelEvent):void
            {
               _2216.deleteConfirm = !param1.data;
            };
            _133.show(tr("OutlineMesh.content"),tr("OutlineMesh.title"),null,onCloseBtnClick,tr("Alert.Confirm"),tr("Alert.Cancel"),"",_2216.deleteConfirm,checkFunction);
         }
         else
         {
            this._4335 = this._4322._4335;
         }
      }
      
      private function _4311() : void
      {
         this._4319(TOOL_MODIFY_VERTEX);
      }
      
      private function _4315() : void
      {
         this._4319(TOOL_ADD_VERTEX);
      }
      
      private function _4306() : void
      {
         this._4319(TOOL_DEL);
      }
      
      private function _4319(param1:int) : void
      {
         if(this._4296 == null)
         {
            return;
         }
         this._4335 = param1;
         this._4322._4335 = param1;
         if(this._4308)
         {
            this._4308.update();
         }
         if(this._4310)
         {
            _14.setCursor(_12.AUTO);
         }
      }
      
      override protected function dispose() : void
      {
         super.dispose();
      }
      
      public function set _4269(param1:_876) : void
      {
         this._4211 = param1;
         this._4305();
      }
      
      public function get _1838() : _70
      {
         return this._4296;
      }
      
      private function get _4238() : _659
      {
         var _loc1_:_659 = _705._3776[this._4296];
         if(_loc1_ == null)
         {
            _loc1_ = new _659(this._4296);
            _705._3776[this._4296] = _loc1_;
         }
         return _loc1_;
      }
      
      public function set _1838(param1:_70) : void
      {
         if(Boolean(param1) && param1.type != _74.MESH)
         {
            param1 = null;
         }
         if(this._4296 != param1 || !this._4332)
         {
            this._4296 = param1;
            if(param1 == null && Boolean(this._4327))
            {
               this._4327._4238 = null;
            }
            if(this._4211 == null || this._4211.stage == null)
            {
               this._4332 = false;
               return;
            }
            this._4332 = true;
            if(this._4296)
            {
               this._2123 = this._4296.mesh;
               this._4210 = this._4238;
               this._4327._4238 = this._4210;
               this._4328 = this._4296._1760;
               this._4322.enabled = true;
               if(this._4331 < 0)
               {
                  this._4322._4335 = TOOL_DEFAULT;
                  this._4335 = TOOL_DEFAULT;
               }
               this._4322.visible = true;
            }
            else
            {
               if(this._4308)
               {
                  this._4308._3024();
               }
               this._4322._4335 = TOOL_NONE;
               this._4335 = TOOL_NONE;
               this._4322.enabled = false;
               this._2123 = null;
               if(this._4210)
               {
                  this._4210.clear();
               }
               this._4210 = null;
               this._4327._4238 = null;
               this._4328 = null;
               this._4322.visible = false;
            }
            if(this._4308 != null && Boolean(this._4296))
            {
               this._4308._4242(this._4210,this._4328);
               this._4308._4269 = this._4211;
               this._4308._4240 = this._4310;
               this._4308.start();
            }
            else if(this._4331 != TOOL_NONE)
            {
               this._4331 = TOOL_NONE;
            }
            this._4323();
         }
      }
      
      protected function get _4314() : String
      {
         return this._4309;
      }
      
      protected function set _4314(param1:String) : void
      {
         if(this._4309 == param1)
         {
            return;
         }
         this._4309 = param1;
         _14.setCursor(this._4309);
      }
      
      public function set _4335(param1:int) : void
      {
         if(this._4331 != param1)
         {
            this._4331 = param1;
            if(this._4308 != null)
            {
               this._4308.stop();
            }
            switch(this._4331)
            {
               case TOOL_ADD_VERTEX:
                  this._4308 = this._4301;
                  this._4301._4229 = this._4327._4324;
                  this._4314 = _12.CURSOR_MESH_ADD;
                  break;
               case TOOL_ADD_EDGE:
                  this._4308 = this._4303;
                  this._4314 = _12.CURSOR_MESH_ADD;
                  break;
               case TOOL_MODIFY_VERTEX:
                  this._4308 = this._4297;
                  this._4297._4313 = this._4327._4313;
                  this._4314 = null;
                  break;
               case TOOL_DEL:
                  this._4308 = this._4304;
                  this._4314 = _12.CURSOR_MESH_DELETE;
                  break;
               case TOOL_OUTLINE:
                  this._4291._3024();
                  this._4308 = this._4299;
                  this._4299._4229 = this._4327._4324;
                  this._4314 = _12.CURSOR_MESH_OUTLINE;
                  break;
               default:
                  this._4308 = null;
                  this._4314 = _12.AUTO;
            }
            if(this._4308 != null && this._4210 != null)
            {
               this._4308._4242(this._4210,this._4328);
               this._4308._4269 = this._4211;
               this._4308._4240 = this._4310;
               this._4308.start();
            }
         }
      }
      
      public function _4323() : void
      {
         if(this._2123)
         {
            this._4322._4336.text = tr("Mesh.tool.info",this._2123.vertices.length);
         }
         else
         {
            this._4322._4336.text = "";
         }
      }
      
      public function _3024() : void
      {
         if(this._4308)
         {
            this._4308._3024();
         }
      }
      
      public function _3173() : void
      {
         if(this._4210 == null)
         {
            return;
         }
         this._4210._2466();
         if(this._4308)
         {
            this._4308._3173();
         }
         this._4291._3173();
         this._4323();
      }
      
      public function refresh() : void
      {
         var _loc1_:_70 = this._4296;
         this._1838 = null;
         this._1838 = _loc1_;
      }
      
      public function _3187() : void
      {
         if(this._4296 == null)
         {
            this._4335 = TOOL_NONE;
            return;
         }
         if(Boolean(this._4322) && this._4322._4335 == TOOL_OUTLINE)
         {
            this._4322._4335 = TOOL_DEFAULT;
            this._4335 = TOOL_DEFAULT;
         }
      }
      
      public function _3170(param1:_661, param2:_661) : void
      {
         if(this._4331 == TOOL_OUTLINE)
         {
            this._4299.execute(param1,param2);
         }
      }
      
      public function _3171() : void
      {
         if(this._4331 == TOOL_OUTLINE)
         {
            this._4299.revert();
         }
      }
      
      protected function get _4291() : _594
      {
         return _1407.getInstance(_594) as _594;
      }
   }
}

