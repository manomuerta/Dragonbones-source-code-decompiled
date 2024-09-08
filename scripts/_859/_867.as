package _859
{
   import _658.Mesh;
   import _724._14085;
   import _724._14087;
   import _724._723;
   import _724._725;
   import _724._726;
   import _724._732;
   import flash.display.Sprite;
   
   public class _867 extends Sprite implements _860
   {
      private var _5741:Boolean;
      
      private var _5740:Boolean;
      
      private var _2101:_725;
      
      private var _6045:LibraryImage;
      
      private var _6043:_861;
      
      private var _6041:_865;
      
      private var _6046:_868;
      
      private var _14743:_14095;
      
      private var _6368:Object;
      
      public var mesh:Mesh;
      
      public function _867()
      {
         super();
      }
      
      public function set _2104(param1:_725) : void
      {
         removeChildren();
         if(param1 is _732)
         {
            if(this.mesh == null)
            {
               this._6045 = new LibraryImage();
               this._6045._2104 = param1;
               this._6045._6040();
               addChild(this._6045);
            }
            else
            {
               this._6046 = new _868();
               this._6046.mesh = this.mesh;
               addChild(this._6046);
            }
         }
         else if(param1 is _726 || param1 is _14087)
         {
            this._6041 = new _865();
            this._6041._2104 = param1;
            addChild(this._6041);
         }
         else if(param1 is _723)
         {
            this._6043 = new _861();
            this._6043._2104 = param1;
            this._6043._6040();
            addChild(this._6043);
         }
         else if(param1 is _14085)
         {
            this._14743 = new _14095();
            this._14743._2104 = param1;
            this._14743._6040();
            addChild(this._14743);
         }
      }
      
      public function gotoAndStop(param1:String, param2:int) : void
      {
         if(this._6043 != null)
         {
            this._6043.gotoAndStop(param1,param2);
         }
      }
      
      public function get _5747() : Boolean
      {
         return this._5741;
      }
      
      public function get _5744() : Boolean
      {
         return this._5740;
      }
      
      public function set _5747(param1:Boolean) : void
      {
         this._5741 = param1;
      }
      
      public function set _5744(param1:Boolean) : void
      {
         this._5740 = param1;
      }
      
      public function dispose() : void
      {
         this.mesh = null;
         while(this.numChildren > 0)
         {
            this.removeChildAt(0);
         }
         if(this._6045)
         {
            this._6045._2104 = null;
            this._6045 = null;
         }
         if(this._6041)
         {
            this._6041._2104 = null;
            this._6041 = null;
         }
         if(this._6043)
         {
            this._6043._2104 = null;
            this._6043.dispose();
            this._6043 = null;
         }
         if(this._6046)
         {
            this._6046._2104 = null;
            this._6046.dispose();
            this._6046 = null;
         }
      }
      
      public function set _5724(param1:Object) : void
      {
         this._6368 = param1;
      }
   }
}

