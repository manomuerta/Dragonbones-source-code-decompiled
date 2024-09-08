package _648
{
   import _18.DBHistoryEvent;
   import _18._21;
   import _51._50;
   import _51._71;
   import _636.DBModelEvent;
   import _639._638;
   import _721._762;
   import _755._756;
   import _755._757;
   import _755._758;
   import _755._760;
   import _755._761;
   import _764.ProjectDataTemplate;
   import _93._95;
   import _97._104;
   import egret.utils.FileUtil;
   import flash.display.BitmapData;
   import flash.utils.ByteArray;
   
   public class _665 extends _95
   {
      public var projectPath:String;
      
      public var _3286:_760;
      
      public var _2824:_761;
      
      public var _1756:_756;
      
      public var libraryData:_757;
      
      public var _2865:_50;
      
      public var isNew:Boolean;
      
      private var _5240:BitmapData;
      
      public var _3536:Object;
      
      public var _13344:Object;
      
      public var _14621:Array;
      
      private var _5798:_21;
      
      public function _665()
      {
         this._14621 = [];
         super();
      }
      
      public static function _3272(param1:String, param2:Array = null, param3:Object = null, param4:Array = null) : Boolean
      {
         var _loc7_:String = null;
         var _loc5_:Object = ProjectDataTemplate.generate(param2,param4);
         if(param3)
         {
            if(_loc5_.stage == null)
            {
               _loc5_.stage = {};
            }
            for(_loc7_ in param3)
            {
               _loc5_.stage[_loc7_] = param3[_loc7_];
            }
         }
         var _loc6_:ByteArray = _104.encode(_loc5_);
         return FileUtil.save(param1,_loc6_);
      }
      
      public static function _5622(param1:String) : _665
      {
         var _loc2_:_665 = new _665();
         _loc2_.projectPath = param1;
         _loc2_._1664();
         return _loc2_;
      }
      
      public function get _10703() : BitmapData
      {
         return this._5240;
      }
      
      public function set _10703(param1:BitmapData) : void
      {
         this._5240 = param1;
      }
      
      public function init(param1:_71) : void
      {
         this._1756 = _756._1572(param1.name,param1.version,param1.frameRate,param1._2126);
         this._2865 = param1._2126[0];
      }
      
      public function _1664() : void
      {
         _758._5796(this);
      }
      
      public function save() : void
      {
         this._5798._1657();
         _758._5797(this);
      }
      
      public function saveAs(param1:_762, param2:_638) : Boolean
      {
         return _758._5795(this,param1,param2);
      }
      
      public function _4189() : void
      {
         _758._4189(this);
      }
      
      private function _5794(param1:DBHistoryEvent) : void
      {
         dispatchEvent(new DBModelEvent(DBModelEvent.DATA_CHANGED));
      }
      
      public function get _1655() : _21
      {
         return this._5798;
      }
      
      public function set _1655(param1:_21) : void
      {
         if(this._5798 == param1)
         {
            return;
         }
         if(this._5798)
         {
            this._5798.removeEventListener(DBHistoryEvent.SAVEABLE_CHANGED,this._5794);
         }
         this._5798 = param1;
         if(this._5798)
         {
            this._5798.addEventListener(DBHistoryEvent.SAVEABLE_CHANGED,this._5794);
         }
      }
      
      public function get dragonBonesVO() : _71
      {
         return this._1756.dragonBonesVO;
      }
      
      public function set dragonBonesVO(param1:_71) : void
      {
         this._1756.dragonBonesVO = param1;
      }
      
      public function get _3543() : Boolean
      {
         return this._5798._1658 || this.isNew;
      }
   }
}

